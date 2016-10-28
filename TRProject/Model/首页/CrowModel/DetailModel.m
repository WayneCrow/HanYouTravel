//
//  DetailModel.m
//  TRProject
//
//  Created by tarena11 on 16/8/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [DetailDataModel class]};
}

@end


@implementation DetailDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"piaos" : [DetailDataPiaosModel class]};
}

@end


@implementation DetailDataPiaosModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"id" : @"ID"};
}

@end


