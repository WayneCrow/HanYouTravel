//
//  HeaderViewModel.m
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "HeaderViewModel.h"

@implementation HeaderViewModel
//Model
- (NSMutableArray<HomeHeaderSettingModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<HomeHeaderSettingModel *> alloc] init];
    }
    return _dataList;
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    self.dataTask = [NetManager getHeaderCompletionHandler:^(HomeHeaderModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [model.data enumerateObjectsUsingBlock:^(HomeHeaderDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                [self.dataList addObject:obj.setting];
            }];
            
        }
        !completionHandler ?:completionHandler(error);
    }];
}
//UI
- (NSInteger)rowNumber {
    return self.dataList.count;
}
- (NSURL *)imageURL:(NSInteger)row {
    return self.dataList[row].imageurl.gc_URL;
}

@end
