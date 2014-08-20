//
//  SHFullAdHelp.h
//  Badminton
//
//  Created by sherwin on 14-8-20.
//  Copyright (c) 2014年 sherwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduMobAdInterstitial.h"

#define SHFullAdHelpAPPKEY (@"1003d326")

@interface SHFullAdHelp : BaiduMobAdInterstitial<BaiduMobAdInterstitialDelegate>

-(id) initBaiduAdType:(BaiduMobAdInterstitialType) adType presentFromViewController:(UIViewController*) tviewControl;
@end
