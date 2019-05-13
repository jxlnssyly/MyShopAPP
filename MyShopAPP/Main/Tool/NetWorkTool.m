//
//  NetWorkTool.m
//  MyShopAPP
//
//  Created by user on 2019/5/13.
//  Copyright © 2019 Ly. All rights reserved.
//

#import "NetWorkTool.h"
#import "AFNetworking.h"


@implementation NetWorkTool

+ (void)POST:(NSString *)url params:(NSMutableDictionary *)params success:(CallBack)successCallBack fail:(CallBack)failCallBack
{
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    
    manage.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manage POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"%f",uploadProgress.)
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !successCallBack? : successCallBack(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failCallBack? : failCallBack(task,error);
    }];
    
}

@end
