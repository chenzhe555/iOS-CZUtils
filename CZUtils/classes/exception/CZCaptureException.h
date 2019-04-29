//
//  CZCaptureException.h
//  CZUtils
//
//  Created by yunshan on 2019/4/27.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CZCaptureExceptionDelegate <NSObject>
@required
/**
 @brief 程序崩溃后的回调事件

 @param exception 异常信息
 */
-(void)dlApplicationError:(NSException *)exception;
@end

@interface CZCaptureException : NSObject
/**
 获取单例
 */
+(instancetype)shareManager;

/**
 开始监听
 */
-(void)startMonitorWithDelegate:(id<CZCaptureExceptionDelegate>)delegate;

/**
 强制退出
 */
-(void)forceExit;

#pragma mark 忽略这两个方法~
/**
 获取Exception的堆栈信息
 */
+(NSArray *)getBacktraceWithException:(NSException *)exception;

/**
 处理异常数据
 */
-(void)handleException:(NSException *)exception;

@end

NS_ASSUME_NONNULL_END
