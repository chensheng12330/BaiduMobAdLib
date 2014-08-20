//
//  SHFullAdHelp.m
//  Badminton
//
//  Created by sherwin on 14-8-20.
//  Copyright (c) 2014年 sherwin. All rights reserved.
//

#import "SHFullAdHelp.h"

@interface SHFullAdHelp ()
@property (nonatomic, assign) UIViewController* viewControl;
@end

@implementation SHFullAdHelp

-(id) initBaiduAdType:(BaiduMobAdInterstitialType) adType presentFromViewController:(UIViewController*) tviewControl
{
    self = [super init];
    if (self) {
        
        self.interstitialType = adType;
        self.delegate    = self;
        self.viewControl = tviewControl;
        [self load];
    }
    return self;
}

- (NSString *)publisherId
{
    return  SHFullAdHelpAPPKEY; //@"your_own_app_id";
}

- (NSString*) appSpec
{
    return SHFullAdHelpAPPKEY;
}

-(BOOL) enableLocation
{
    //启用location会有一次alert提示
    return NO;
}

/**
 *  广告预加载成功
 */
- (void)interstitialSuccessToLoadAd:(BaiduMobAdInterstitial *)interstitial
{
    if (self.isReady) {
        [self presentFromRootViewController:self.viewControl];
    }
}

/**
 *  广告预加载失败
 */
- (void)interstitialFailToLoadAd:(BaiduMobAdInterstitial *)interstitial
{

}

/**
 *  广告即将展示
 */
- (void)interstitialWillPresentScreen:(BaiduMobAdInterstitial *)interstitial
{
}

/**
 *  广告展示成功
 */
- (void)interstitialSuccessPresentScreen:(BaiduMobAdInterstitial *)interstitial
{
}

/**
 *  广告展示失败
 */
- (void)interstitialFailPresentScreen:(BaiduMobAdInterstitial *)interstitial withError:(BaiduMobFailReason) reason
{
}

/**
 *  广告展示结束
 */
- (void)interstitialDidDismissScreen:(BaiduMobAdInterstitial *)interstitial
{
}


@end
