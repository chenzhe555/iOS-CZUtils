//
//  CZNavigationRouter.h
//  CZUtils
//
//  Created by yunshan on 2019/4/28.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CZNavigationRouterType) {
    CZNavigationRouterTypePush = 1,
    CZNavigationRouterTypePresent
};

NS_ASSUME_NONNULL_BEGIN

@interface CZNavigationRouter : NSObject

/**
 @brief Key(类名key)-Value(类名)字典,项目中可自定义赋值实现,结合pushVCWithKey / presentVCWithKey 使用
 */
@property (nonatomic, strong) NSMutableDictionary * VCDic;

/**
 @brief 获取当前实例
 */
+(instancetype)shareManager;

/**
 @brief Push 跳转到对应VC

 @param vcName VC类名
 @param params 传递的参数
 */
-(void)pushVC:(NSString *)vcName params:(NSDictionary * _Nullable)params;

/**
 @brief Present 跳转到对应VC
 
 @param vcName VC类名
 @param params 传递的参数
 */
-(void)presentVC:(NSString *)vcName params:(NSDictionary * _Nullable)params callback:(void (^)(void))callback;

/**
 @brief Push 通过Key跳转到对应VC
 
 @param key VC类名对应Key
 @param params 传递的参数
 */
-(void)pushVCWithKey:(NSString *)key params:(NSDictionary * _Nullable)params;

/**
 @brief Present 通过Key跳转到对应VC
 
 @param key VC类名对应Key
 @param params 传递的参数
 */
-(void)presentVCWithKey:(NSString *)key params:(NSDictionary * _Nullable)params callback:(void (^)(void))callback;
@end

NS_ASSUME_NONNULL_END
