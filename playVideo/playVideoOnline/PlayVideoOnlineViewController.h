//
//  PlayVideoOnlineViewController.h
//  EggplantAlbums
//
//  Created by YunInfo on 13-8-22.
//  Copyright (c) 2013年 YunInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayVideoOnlineViewController : UIViewController{
MPMoviePlayerViewController    *mpMoviePlayer;
NSURL                           *videoURL;
}
@property(nonatomic,retain)NSURL                *videoURL;
@end
