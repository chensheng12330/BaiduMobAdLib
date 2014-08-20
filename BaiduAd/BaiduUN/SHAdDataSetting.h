//
//  SHAdDataSetting.h
//  BaiduAd
//
//  Created by sherwin on 14-8-20.
//  Copyright (c) 2014年 sherwin. All rights reserved.
//

#ifndef BaiduAd_SHAdDataSetting_h
#define BaiduAd_SHAdDataSetting_h


#import <Foundation/Foundation.h>
/* userInfo Key
 
 */
#define SHAD_USER_keywords (@"keywords")  //用户人群关键字 value => [NSArray] 数据类型
#define SHAD_USER_userCity (@"userCity")  //用户所在城市   value => NSString
#define SHAD_USER_userPCode (@"userPCode") //用户邮编      value => NSString
#define SHAD_USER_userWork  (@"userWork")  //- 用户职业    value => NSString
#define SHAD_USER_userSalary (@"userSalary")//用户收入     value => NSNumber
#define SHAD_USER_userHobbies (@"userHobbies") //用户爱好  value => [NSArray]


@protocol SHAdDataDelegate <NSObject>


@end

#endif
