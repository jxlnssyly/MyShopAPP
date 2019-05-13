//
//  NetWorkTool.h
//  MyShopAPP
//
//  Created by user on 2019/5/13.
//  Copyright © 2019 Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CallBack)(id response, id code);
@interface NetWorkTool : NSObject
+ (void)POST:(NSString *)url params:(NSMutableDictionary *)params success:(CallBack)callBack fail:(CallBack)failCallBack;

@end
