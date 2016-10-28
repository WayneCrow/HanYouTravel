//
//  HomeHeaderModel.m
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "HomeHeaderModel.h"

@implementation HomeHeaderModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[HomeHeaderDataModel class]};
}

@end



@implementation HomeHeaderDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"ID":@"id"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"setting":[HomeHeaderSettingModel class]};
}

@end



@implementation HomeHeaderSettingModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"imageurl":@"1.imageurl",
             @"target_id":@"1.target_id",
             @"alt":@"1.alt",
             @"module":@"1.module",
             @"price":@"1.price",
             @"linkurl":@"1.linkurl"};
}

@end