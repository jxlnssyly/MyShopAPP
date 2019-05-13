//
//  NSString+LyAdd.m
//  MyShopAPP
//
//  Created by user on 2019/5/13.
//  Copyright © 2019 Ly. All rights reserved.
//

#import "NSString+LyAdd.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (LyAdd)
- (NSString *) md5 {
    // 判断传入的字符串是否为空
    if (! self) return nil;
    // 转成utf-8字符串
    const char *cStr = self.UTF8String;
    // 设置一个接收数组
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    // 对密码进行加密
    CC_MD5(cStr, (CC_LONG) strlen(cStr), result);
    NSMutableString *md5Str = [NSMutableString string];
    // 转成32字节的16进制
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        [md5Str appendFormat:@"%02x", result[i]];
    }
    return md5Str;
}

@end
