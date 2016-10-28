//
//  NSString+GC.m
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NSString+GC.h"

@implementation NSString (GC)
- (NSURL *)gc_URL {
    return [NSURL URLWithString:self];
}
@end
