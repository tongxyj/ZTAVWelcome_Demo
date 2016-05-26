//
//  CZAVPlayerView.m
//  AVPlayer
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZAVPlayerView.h"

@implementation CZAVPlayerView

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

#pragma mark -

- (AVPlayer *)player
{
    return ((AVPlayerLayer *)self.layer).player;
}

- (void)setPlayer:(AVPlayer *)player
{
    ((AVPlayerLayer *)self.layer).player = player;
}
@end
