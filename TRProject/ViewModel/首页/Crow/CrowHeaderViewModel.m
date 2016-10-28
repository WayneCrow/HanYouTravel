//
//  CrowHeaderViewModel.m
//  TRProject
//
//  Created by tarena11 on 16/8/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "CrowHeaderViewModel.h"

@implementation CrowHeaderViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    self.dataTask = [NetManager getCrowHeaderCompletionHandler:^(HomeHeaderModel *model, NSError *error) {
        
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.adList removeAllObjects];
            }
            [model.data enumerateObjectsUsingBlock:^(HomeHeaderDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.adList addObject:obj.setting];
            }];
        }
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSInteger)adNumber {
    return self.adList.count;
}

- (NSURL *)imageURL:(NSInteger)item {
    return self.adList[item].imageurl.gc_URL;
}

#pragma mark - LazyLoad (懒加载)

- (NSMutableArray<HomeHeaderSettingModel *> *)adList {
    if(_adList == nil) {
        _adList = [[NSMutableArray<HomeHeaderSettingModel *> alloc] init];
    }
    return _adList;
}

@end
