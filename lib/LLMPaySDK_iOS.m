//
//  LLMPaySDK_iOS.m
//  LLMPaySDK_iOS
//
//  Created by byRong on 2019/4/2.
//  Copyright © 2019 joker. All rights reserved.
//

#import "LLMPaySDK_iOS.h"

@implementation LLMPaySDK_iOS
//指定这个模块在JS端的名称
RCT_EXPORT_MODULE(LLMPay);
//指定所有的方法都在主线程中执行
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(payApply:(NSString *)paymentInfo complete:(RCTResponseSenderBlock)complete)
{
  [[LLMPay sharedSdk] payApply:paymentInfo complete:^(LLMPayResult result, NSDictionary *dic) {
    complete(@[[NSNull null], @(result), dic]);
  }];
}

RCT_EXPORT_METHOD(signApply:(NSString *)paymentInfo complete:(RCTResponseSenderBlock)complete)
{
  [[LLMPay sharedSdk] signApply:paymentInfo complete:^(LLMPayResult result, NSDictionary *dic) {
    complete(@[[NSNull null], @(result), dic]);
  }];
}

RCT_EXPORT_METHOD(switchToTestServer:(BOOL)isTestServer)
{
  [LLMPay switchToTestServer:isTestServer];
}

RCT_EXPORT_METHOD(getSDKVersion:(RCTResponseSenderBlock)callback)
{
  NSString *version = [LLMPay getSDKVersion];
  callback(@[[NSNull null], version]);
}
@end
