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
   
}

RCT_EXPORT_METHOD(navigation:(NSString *)destination) {
    
}

RCT_EXPORT_METHOD(payment) {
    
}
@end
