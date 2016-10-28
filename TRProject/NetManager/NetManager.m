//
//  NetManager.m
//  TRProject
//
//  Created by tarena on 16/7/14.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NetManager.h"
#define kHearoPath @"http://www.hanyouwang.com/index.php?m=api&device=app&c=poster&a=getPosters&spaceid=79"

/**
 *  Crow Path
 */

#define kCrowHeaderPath @"http://www.hanyouwang.com/index.php?m=api&device=app&c=poster&a=getPosters&spaceid=56"

#define kCrowSauna @"http://www.hanyouwang.com/index.php?m=api&device=app&c=piao&a=getProductList&city=&height=160&hotFilters=&page=%ld&pageSize=20&sortBy=1&theme=25&title=&width=160"
#define kCrowFoodPath @"http://www.hanyouwang.com/index.php?m=api&device=app&c=piao&a=getProductList&city=&height=160&hotFilters=&page=%ld&pageSize=20&sortBy=1&theme=26&title=&width=160"

@implementation NetManager
+ (id)getHeaderCompletionHandler:(void (^)(HomeHeaderModel *, NSError *))completionHandler {
    return [self GET:kHearoPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([HomeHeaderModel parse:responseObj],error);
    }];
}

/**
 *  Crow NetManager
 */

// 头部广告
+ (id)getCrowHeaderCompletionHandler:(void (^)(HomeHeaderModel *, NSError *))completionHadler {
    return [self GET:kCrowHeaderPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHadler ?: completionHadler([HomeHeaderModel parse:responseObj], error);
    }];
}

// 桑拿


// 餐饮美食
+ (id)getCrowFoodPage:(NSInteger)page completionHandler:(void (^)(DetailModel *, NSError *))completinoHandler {
    NSString *path = [NSString stringWithFormat:kCrowFoodPath, page];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completinoHandler ?: completinoHandler([DetailModel parse:responseObj], error);
    }];
}

@end
