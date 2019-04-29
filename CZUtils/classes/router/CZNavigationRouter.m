//
//  CZNavigationRouter.m
//  CZUtils
//
//  Created by yunshan on 2019/4/28.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "CZNavigationRouter.h"
#import <CZCategorys/NSObject+CZCategory.h>
#import <CZCategorys/NSDictionary+CZCategory.h>

@implementation CZNavigationRouter
+(instancetype)shareManager
{
    static id router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[self class] init];
    });
    return router;
}

-(void)pushVC:(NSString *)vcName params:(NSDictionary *)params
{
    UIViewController * vc = [self getCurrentShowVC];
    if (vc.navigationController) {
        UIViewController * pushVC = [self configVC:vcName params:params];
        if(pushVC) [vc.navigationController pushViewController:pushVC animated:YES];
    }
}

-(void)presentVC:(NSString *)vcName params:(NSDictionary *)params callback:(nonnull void (^)(void))callback
{
    UIViewController * vc = [self getCurrentShowVC];
    if (vc.navigationController) {
        UIViewController * pushVC = [self configVC:vcName params:params];
        if(pushVC) [vc presentViewController:pushVC animated:YES completion:callback];
    }
}

-(void)pushVCWithKey:(NSString *)key params:(NSDictionary *)params
{
    if ([self.VCDic containKey:key]) {
        [self pushVC:self.VCDic[key] params:params];
    }
}

-(void)presentVCWithKey:(NSString *)key params:(NSDictionary *)params callback:(void (^)(void))callback
{
    if ([self.VCDic containKey:key]) {
        [self presentVC:self.VCDic[key] params:params callback:callback];
    }
}

#pragma mark 自定义方法
-(UIViewController *)configVC:(NSString *)vcName params:(NSDictionary *)params
{
    UIViewController * pushVC = [[NSClassFromString(vcName) alloc] init];
    if (params) {
        for (NSString * key in params) {
            if ([pushVC valueForKey:key]) [pushVC setValue:params[key] forKey:key];
        }
    }
    return pushVC;
}

@end
