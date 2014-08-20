//
//  SHAdHelp.h
//  Badminton
//
//  Created by sherwin on 14-8-19.
//  Copyright (c) 2014年 sherwin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaiduMobAdView.h"
#import "BaiduMobAdDelegateProtocol.h"


#define kAdViewPortraitRect CGRectMake(0, 0, SH_SCREEN_WIDTH, kBaiduAdViewSizeDefaultHeight)

#define SHADHlepAPPKEY (@"1003d326")

@interface SHAdHelp : BaiduMobAdView<BaiduMobAdViewDelegate>

/*
 @see 初使化视图，广告会覆盖SHAdHelp View.
 视国底部颜色可进行设置，返回值UIView为 SHAdHelp对象。
 如需要要广告对象可从 baiduMobAd属性中获取
*/
-(id) initBaiduAdType:(BaiduMobAdViewType) adType withFrame:(CGRect) frame;


@end
