//
//  HeaderViewModel.h
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeHeaderModel.h"
#import "BaseViewModel.h"
#import "NetManager.h"

@interface HeaderViewModel : BaseViewModel
//UI
@property(nonatomic,readonly) NSInteger rowNumber;
- (NSURL *)imageURL:(NSInteger)row;

//Model
@property(nonatomic) NSMutableArray<HomeHeaderSettingModel *> *dataList;


@end
