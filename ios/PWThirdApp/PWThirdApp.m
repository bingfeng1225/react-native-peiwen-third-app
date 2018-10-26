//
//  PWThirdApp.m
//  PWThirdApp
//
//  Created by Nick on 2018/10/26.
//  Copyright © 2018 hisense. All rights reserved.
//

#if __has_include(<React/RCTConvert.h>)
#import <React/RCTConvert.h>
#elif __has_include("RCTConvert.h")
#import "RCTConvert.h"
#else
#import "React/RCTConvert.h"   // Required when used as a Pod in a Swift project
#endif

#import "PWThirdApp.h"

@implementation PWThirdApp

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(phonecall:(NSString *)phone) {
    NSString *urlsting = [NSString stringWithFormat:@"telprompt:%@",phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlsting]];
}

RCT_EXPORT_METHOD(navigation:(NSString *)destination) {
    if([self gaodeNavigation:destination]){
        return;
    }
    if([self baiduNavigation:destination]){
        return;
    }
}

- (BOOL)gaodeNavigation:(NSString *)destination{
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]){
        return NO;
    }
    
    NSString *urlsting = [[NSString stringWithFormat:@"iosamap://path?sourceApplication=智慧助理&sid=BGVIS1&sname=%@&did=BGVIS2&dname=%@&dev=0&t=0",@"我的位置",destination] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlsting]];
    return YES;
}

- (BOOL)baiduNavigation:(NSString *)destination{
    if (![[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"baidumap://map/"]]){
        return NO;
    }
    NSString *urlsting = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=%@&mode=driving",destination] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlsting]];
    return YES;
}

RCT_EXPORT_METHOD(payment) {
    if([self alipayPayment]){
        return;
    }
}

- (BOOL)alipayPayment{
    if (![[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"alipay://"]]){
        return NO;
    }
    NSString *urlsting = @"alipay://platformapi/startapp?saId=10000007";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlsting]];
    return YES;
}

@end
