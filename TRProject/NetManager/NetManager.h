//
//  NetManager.h
//  TRProject
//
//  Created by tarena on 16/7/14.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseNetworking.h"
#import "HomeHeaderModel.h"

/**
 *  Crow
 */
#import "DetailModel.h"

@interface NetManager : BaseNetworking
//首页头部
+ (id)getHeaderCompletionHandler:(void(^)(HomeHeaderModel *model, NSError *error))completionHandler;

/**
 *  Crow NetManager
 */
+ (id)getCrowHeaderCompletionHandler:(void(^)(HomeHeaderModel *model, NSError *error))completionHadler;

// 桑拿汗蒸
+ (id)getCrowSaunaPage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 餐饮美食
+ (id)getCrowFoodPage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 主题乐园
+ (id)getCrowParadisePage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 地标建筑
+ (id)getCrowLandmarkPage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 韩剧拍摄
+ (id)getCrowShootPage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 特色展馆
+ (id)getCrowPavilionPage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 文化体验
+ (id)getCrowCulturePage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 交通观光
+ (id)getCrowTrafficPage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 温泉滑雪
+ (id)getCrowSkingPage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;
// 全部
+ (id)getCrowAllPage:(NSInteger)page completionHandler:(void(^)(DetailModel *model, NSError *error))completinoHandler;


@end
