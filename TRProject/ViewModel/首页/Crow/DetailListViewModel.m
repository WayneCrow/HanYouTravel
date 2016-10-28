//
//  DetailListViewModel.m
//  TRProject
//
//  Created by tarena11 on 16/8/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "DetailListViewModel.h"

@implementation DetailListViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = self.page + 1;
    }
    
    self.dataTask = [NetManager getCrowFoodPage:tmpPage completionHandler:^(DetailModel *model, NSError *error) {
        
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data.piaos];
        }
        !completionHandler ?: completionHandler(error);
    }];
    
    _page = tmpPage;
}

- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSURL *)showImageForRow:(NSInteger)row {
    return self.dataList[row].thumb.gc_URL;
}

- (NSString *)titleForRow:(NSInteger)row {
    return self.dataList[row].title;
}

- (BOOL)isCanBookForRow:(NSInteger)row {
    return self.dataList[row].isBookToday;
}

- (NSString *)soldCountForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%@人已购买", self.dataList[row].rankCount];
}

- (NSString *)locationForRow:(NSInteger)row {
    return self.dataList[row].city;
}

- (NSString *)markPriceForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"￥%@", self.dataList[row].market_price];
}

- (NSString *)salesPriceFowRow:(NSInteger)row {
    return self.dataList[row].sales_price;
}

- (NSString *)discountForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%@折", self.dataList[row].discount];
}

#pragma mark - LazyLoad (懒加载)

- (NSInteger)page {
    if(!_page) {
        _page = 0;
    }
    return _page;
}

- (NSMutableArray<DetailDataPiaosModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<DetailDataPiaosModel *> alloc] init];
    }
    return _dataList;
}

@end
