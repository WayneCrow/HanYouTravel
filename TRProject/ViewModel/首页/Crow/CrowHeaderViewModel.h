//
//  CrowHeaderViewModel.h
//  TRProject
//
//  Created by tarena11 on 16/8/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseViewModel.h"
#import "HomeHeaderModel.h"
#import "NetManager.h"

@interface CrowHeaderViewModel : BaseViewModel

@property (nonatomic) NSInteger adNumber;
- (NSURL *)imageURL:(NSInteger)item;

@property (nonatomic) NSMutableArray<HomeHeaderSettingModel *> *adList;

@end
