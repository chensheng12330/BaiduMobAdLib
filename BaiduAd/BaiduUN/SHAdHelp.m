//
//  SHAdHelp.m
//  Badminton
//
//  Created by sherwin on 14-8-19.
//  Copyright (c) 2014年 sherwin. All rights reserved.
//

#import "SHAdHelp.h"

@interface SHAdHelp ()

@property (nonatomic, retain) NSArray *gobleAry;

@property (nonatomic, assign) id extDelegate;

@property (nonatomic, assign) SEL delegSel;
@end

@implementation SHAdHelp

- (void)dealloc
{
    [super dealloc];
}

-(id) initBaiduAdType:(BaiduMobAdViewType) adType withFrame:(CGRect) frame delegate:(id<BaiduMobAdViewDelegate>) tdelegate
{
    self = [super init];
    if (self) {
        
        self.gobleAry = @[@"购物",@"游戏",@"美女",@"淘宝",@"网购",@"app",@"iphone",@"运动",@"户外",@"体育",@"羽毛球",@"网球",@"蓝球"];
        
        self.AdType = adType;
        self.frame  = frame;
        self.delegate= self;
        
        self.extDelegate = tdelegate;
        
        self.delegSel = @selector(AdInfo:Event:);
    }
    return self;
}


#pragma mark - BaiduAd Delegate
- (NSString *)publisherId
{
    return  self.appID==NULL?@"1003d326":self.appID; //@"your_own_app_id";
}

- (NSString*) appSpec
{
    //注意：该计费名为测试用途，不会产生计费，请测试广告展示无误以后，替换为您的应用计费名，然后提交AppStore.
    return  self.appID==NULL?@"1003d326":self.appID;
}

-(BOOL) enableLocation
{
    //启用location会有一次alert提示
    return YES;
}


-(void) willDisplayAd:(BaiduMobAdView*) adview
{
    //在广告即将展示时，产生一个动画，把广告条加载到视图中
    adview.hidden = NO;
    
    //动画效果
    
    CGRect f = adview.frame;
    f.origin.x = -320;
    adview.frame = f;
    [UIView beginAnimations:nil context:nil];
    f.origin.x = 0;
    adview.frame = f;
    [UIView commitAnimations];
    //NSLog(@"delegate: will display ad");
    
    
    if ([self.extDelegate respondsToSelector:self.delegSel]) {
        [self.extDelegate AdInfo:self Event:AD_WillShow];
    }
    
}

-(void) failedDisplayAd:(BaiduMobFailReason) reason;
{
    NSLog(@"delegate: failedDisplayAd %d", reason);
    //加载失败处理
    
    if ([self.extDelegate respondsToSelector:self.delegSel]) {
        [self.extDelegate AdInfo:self Event:AD_LoadFaile];
    }
}

/**
 *  本次广告展示成功时的回调
 */
-(void) didAdImpressed
{
    if ([self.extDelegate respondsToSelector:self.delegSel]) {
        [self.extDelegate AdInfo:self Event:AD_LoadOK];
    }
}

/**
 *  本次广告展示被用户点击时的回调
 */
-(void) didAdClicked
{
    //用户点击广告处理
    if ([self.extDelegate respondsToSelector:self.delegSel]) {
        [self.extDelegate AdInfo:self Event:AD_ClickAd];
    }
}

/**
 *  在用户点击完广告条出现全屏广告页面以后，用户关闭广告时的回调
 */
-(void) didDismissLandingPage
{
    //用户关闭广告处理
    if ([self.extDelegate respondsToSelector:self.delegSel]) {
        [self.extDelegate AdInfo:self Event:AD_CloseAd];
    }
}

//人群属性接口
/**
 *  - 关键词数组
 */
-(NSArray*) keywords{
    
    NSArray *tempAr = self.userInfo[SHAD_USER_keywords];
    if (tempAr) {
        return tempAr;
    }
    
    return self.gobleAry;
}

/**
 *  - 用户性别
 */
-(BaiduMobAdUserGender) userGender{
    return BaiduMobAdSexUnknown;
}

/**
 *  - 用户生日
 */
//-(NSDate*) userBirthday{
//    NSDate* birthday = [NSDate dateWithTimeIntervalSince1970:0];
//    return birthday;
//}

/**
 *  - 用户城市
 */
-(NSString*) userCity{
    
    NSString *tempstr = self.userInfo[SHAD_USER_userCity];
    if (tempstr) {
        return tempstr;
    }
    
    return @"深圳";
}


/**
 *  - 用户邮编
 */
-(NSString*) userPostalCode{
    
    NSString *tempstr = self.userInfo[SHAD_USER_userPCode];
    if (tempstr) {
        return tempstr;
    }
    
    return @"518031";
}


/**
 *  - 用户职业
 */
-(NSString*) userWork{
    
    NSString *tempstr = self.userInfo[SHAD_USER_userWork];
    if (tempstr) {
        return tempstr;
    }
    
    return @"体育";
}

/**
 *  - 用户最高教育学历
 *  - 学历输入数字，范围为0-6
 *  - 0表示小学，1表示初中，2表示中专/高中，3表示专科
 *  - 4表示本科，5表示硕士，6表示博士
 */
-(NSInteger) userEducation{
    return  4;
}

/**
 *  - 用户收入
 *  - 收入输入数字,以元为单位
 */
-(NSInteger) userSalary{
    
    NSNumber *tempNum = self.userInfo[SHAD_USER_userSalary];
    if (tempNum) {
        return [tempNum integerValue];
    }
    
    return 12000;
}

/**
 *  - 用户爱好
 */
-(NSArray*) userHobbies{
    
    NSArray *tempAr = self.userInfo[SHAD_USER_userHobbies];
    if (tempAr) {
        return tempAr;
    }
    
    return self.gobleAry;
}

/**
 *  - 其他自定义字段
 */
/*
-(NSDictionary*) userOtherAttributes{
    NSMutableDictionary* other = [[[NSMutableDictionary alloc] init] autorelease];
    [other setValue:@"全民羽毛球" forKey:@"appInfo"];
    return other;
}
*/
@end
