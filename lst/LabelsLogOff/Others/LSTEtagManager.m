//
//  LSTEtagManager.m
//  DirectorySpecification
//
//  Created by Pactera_Admin on 2017/4/10.
//  Copyright © 2017年 lwsc. All rights reserved.
//

#import "LSTEtagManager.h"

@interface LSTEtagManager ()<NSCoding>

@end

@implementation LSTEtagManager

static LSTEtagManager * _instance = nil;

+ (instancetype)shareLSTEtagManager
{
    static dispatch_once_t preicate;
    dispatch_once(&preicate, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [LSTEtagManager shareLSTEtagManager] ;
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [LSTEtagManager shareLSTEtagManager] ;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int outCount;
        Ivar * ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i ++) {
            Ivar ivar = ivars[i];
            NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int outCount;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }

}


@end
