//
//  SCWeiboManager.h
//  SCWeiboManagerDemo
//
//  Created by Singro on 6/4/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import "WeiboSDK.h"

#error setup weibo appkey & redirect url
static NSString *const kWeiboAppKey = @"";
static NSString *const kWeiboRedirectUrl = @"";

@interface SCWeiboManager : NSObject <WeiboSDKDelegate>

@property (nonatomic, readonly, getter = isExpired) BOOL expired;

+ (instancetype)manager;

- (void)clean;


#pragma mark - Authorize

- (WBAuthorizeRequest *)authorizeToWeiboSuccess:(void (^)(WBBaseResponse *response))success
                                      failure:(void (^)(NSError *error))failure;



#pragma mark - Send Weibo

- (WBHttpRequest *)sendWeiboWithText:(NSString *)text
                             Success:(void (^)(NSDictionary *responseDict))success
                             failure:(void (^)(NSError *error))failure;

- (WBHttpRequest *)sendWeiboWithText:(NSString *)text
                               image:(UIImage *)image
                             Success:(void (^)(NSDictionary *responseDict))success
                             failure:(void (^)(NSError *error))failure;


@end
