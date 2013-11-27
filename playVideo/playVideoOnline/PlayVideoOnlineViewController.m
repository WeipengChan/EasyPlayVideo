//
//  PlayVideoOnlineViewController.m
//  EggplantAlbums
//
//  Created by YunInfo on 13-8-22.
//  Copyright (c) 2013年 YunInfo. All rights reserved.
//

#import "PlayVideoOnlineViewController.h"

@interface PlayVideoOnlineViewController ()

@end

@implementation PlayVideoOnlineViewController
@synthesize videoURL;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self playVideo];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.view.frame=CGRectMake(0, 0, size.width, size.height);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [videoURL release];
    
    [mpMoviePlayer release];
    mpMoviePlayer = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [super dealloc];
}
-(void)playVideo{
   
    if(mpMoviePlayer){
        [mpMoviePlayer removeFromParentViewController];
        [mpMoviePlayer release];
        mpMoviePlayer=nil;
    }
    mpMoviePlayer=[[MPMoviePlayerViewController alloc]initWithContentURL:videoURL];
    //注册观察者,监听"播放完毕"消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadState:)
                                                 name:MPMoviePlayerLoadStateDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishPlay:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    
       // mpMoviePlayer.moviePlayer.shouldAutoplay = NO;
    //[self presentMoviePlayerViewControllerAnimated:mpMoviePlayer];
        [mpMoviePlayer.view setFrame:self.view.bounds];
        [self.view addSubview:mpMoviePlayer.view];
}
#pragma mark -
#pragma mark afterPlayVedio
-(void)finishPlay:(NSNotification *) notification {
    [self showHudMessage:@"播放完成" hideAfterDelay:1.0];
    [mpMoviePlayer.view removeFromSuperview];
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self dismissModalViewControllerAnimated:YES];
    }
    
}
-(void)loadState:(NSNotification *) notification {
    MPMovieLoadState state = mpMoviePlayer.moviePlayer.loadState;
    if(state==MPMovieLoadStateUnknown){
        
    [mpMoviePlayer.view removeFromSuperview];
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self dismissModalViewControllerAnimated:YES];
    }
    }
    
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -
#pragma mark HUD
-(void) showHudMessage:(NSString*) msg hideAfterDelay:(double) sec{
//    MBProgressHUD* hud2 = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud2.mode = MBProgressHUDModeText;
//    hud2.labelText = msg;
//    hud2.margin = 12.0f;
//    hud2.yOffset = 20.0f;
//    hud2.removeFromSuperViewOnHide = YES;
//    [hud2 hide:YES afterDelay:sec];
}
@end
