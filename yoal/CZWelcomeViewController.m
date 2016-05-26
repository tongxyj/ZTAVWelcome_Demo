//
//  CZWelcomeViewController.m
//  PreWallet
//
//  Created by apple on 15/8/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZWelcomeViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CZAVPlayerView.h"
#import "ZTLoginView.h"
#define kRotateImageViewWidth 30

@interface CZWelcomeViewController ()
{
    AVPlayer *_player;
    CZAVPlayerView *_playerView;
    UIButton *_loginBtn; // 登录按钮
    UIButton *_coverBtn; // 遮盖按钮
    ZTLoginView *_loginView; // 登陆界面
}
@end

@implementation CZWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self playVideo];
    [self setupUI];
    // 进入后台时暂停播放视频
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pauseVideo) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(play) name:UIApplicationWillEnterForegroundNotification object:nil];
}
- (void)pauseVideo {
    [_player pause];
}
- (void)setupUI {
  
    _loginBtn = [[UIButton alloc] init];
    [_loginBtn sizeToFit];
    // 登陆按钮
    CGFloat loginX = self.view.frame.size.width - _loginBtn.frame.size.width - 40;
    CGFloat loginY = self.view.frame.size.height - _loginBtn.frame.size.height - 40;
    [_loginBtn setFrame:CGRectMake(loginX, loginY, _loginBtn.frame.size.width + 20, _loginBtn.frame.size.height + 20)];
    [_loginBtn setImage:[UIImage imageNamed:@"login_btn"] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(gotoMain) forControlEvents:UIControlEventTouchUpInside];
    [_playerView addSubview:_loginBtn];

}
- (void)play {
    [_player play];
}
- (void)gotoMain {
    // 添加遮盖
    _coverBtn = [[UIButton alloc] initWithFrame:self.view.bounds];
    _coverBtn.backgroundColor = [UIColor blackColor];
    _coverBtn.alpha = 0.4;
    [_playerView addSubview:_coverBtn];
    [_coverBtn addTarget:self action:@selector(coverDidClick:) forControlEvents:UIControlEventTouchUpInside];
    // 添加登陆界面
    ZTLoginView *loginView = [[ZTLoginView alloc] initWithFrame:self.view.bounds];
    _loginView = loginView;
    [_playerView addSubview:loginView];
   
    // 隐藏登陆按钮
    _loginBtn.hidden = YES;
}
- (void)coverDidClick:(UIButton *)sender {
    [_coverBtn removeFromSuperview];
    [_loginView removeFromSuperview];
    _loginBtn.hidden = NO;
}
- (void)playVideo {
    _playerView = [[CZAVPlayerView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_playerView];
    NSURL * webURL = [[NSBundle mainBundle]URLForResource:@"welcome" withExtension:@"mp4"];
    _player = [AVPlayer playerWithURL:webURL];
    [_player play];
    [((AVPlayerLayer *)_playerView.layer) setPlayer:_player];
    [((AVPlayerLayer *)_playerView.layer) setVideoGravity:AVLayerVideoGravityResize];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(runLoopTheMovie:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
}

- (void)runLoopTheMovie:(NSNotification *)n{
    //注册的通知  可以自动把 AVPlayerItem 对象传过来，只要接收一下就OK
    
    AVPlayerItem * p = [n object];
    //关键代码
    [p seekToTime:kCMTimeZero];
    
    [_player play];
}




// 把status bar 隐藏掉
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
