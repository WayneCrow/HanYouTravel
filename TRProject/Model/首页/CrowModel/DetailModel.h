//
//  DetailModel.h
//  TRProject
//
//  Created by tarena11 on 16/8/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailDataModel,DetailDataPiaosModel;

@interface DetailModel : NSObject

@property (nonatomic, copy  ) NSString  *message;
@property (nonatomic, strong) DetailDataModel *data;
@property (nonatomic, assign) NSInteger code;

@end


@interface DetailDataModel : NSObject

@property (nonatomic, strong) NSArray<DetailDataPiaosModel *> *piaos;
@property (nonatomic, copy  ) NSString  *total;
@property (nonatomic, assign) NSInteger pages;

@end


@interface DetailDataPiaosModel : NSObject

// id —> ID
@property (nonatomic, copy  ) NSString *ID;
@property (nonatomic, copy  ) NSString *sales_price;
@property (nonatomic, copy  ) NSString *discount;
@property (nonatomic, copy  ) NSString *subtitle;
@property (nonatomic, copy  ) NSString *thumb;
@property (nonatomic, copy  ) NSString *url;
@property (nonatomic, strong) NSArray<NSString *> *pictures;
@property (nonatomic, copy  ) NSString *market_price;
@property (nonatomic, copy  ) NSString *title;
@property (nonatomic, copy  ) NSString *rankCount;
@property (nonatomic, copy  ) NSString *city;
@property (nonatomic, copy  ) NSString *isBookToday;

@end

