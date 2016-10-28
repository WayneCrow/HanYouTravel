//
//  DetailListViewModel.h
//  TRProject
//
//  Created by tarena11 on 16/8/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseViewModel.h"
#import "NetManager.h"
#import "DetailModel.h"

@interface DetailListViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;
- (NSURL *)showImageForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (BOOL)isCanBookForRow:(NSInteger)row;
- (NSString *)soldCountForRow:(NSInteger)row;
- (NSString *)locationForRow:(NSInteger)row;
- (NSString *)markPriceForRow:(NSInteger)row;
- (NSString *)salesPriceFowRow:(NSInteger)row;
- (NSString *)discountForRow:(NSInteger)row;

@property (nonatomic) NSInteger page;
@property (nonatomic) NSMutableArray<DetailDataPiaosModel *> *dataList;

@end
