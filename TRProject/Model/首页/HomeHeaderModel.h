//
//  HomeHeaderModel.h
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeHeaderDataModel,HomeHeaderSettingModel;
@interface HomeHeaderModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NSArray<HomeHeaderDataModel *> *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface HomeHeaderDataModel : NSObject
//id --> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *enddate;

@property (nonatomic, copy) NSString *startdate;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *addtime;

@property (nonatomic, copy) NSString *disabled;

@property (nonatomic, strong) HomeHeaderSettingModel *setting;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *indexShow;

@property (nonatomic, copy) NSString *module;

@property (nonatomic, copy) NSString *clicks;

@property (nonatomic, copy) NSString *hits;

@property (nonatomic, copy) NSString *listorder;

@property (nonatomic, copy) NSString *spaceid;

@property (nonatomic, copy) NSString *siteid;

@property (nonatomic, copy) NSString *name;

@end

@interface HomeHeaderSettingModel : NSObject

//@property (nonatomic, strong) 1 *1;
//
//@end
//
//@interface 1 : NSObject

@property (nonatomic, copy) NSString *imageurl;

@property (nonatomic, copy) NSString *target_id;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *module;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *linkurl;

@end

