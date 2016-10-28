//
//  CrowShowListTableViewController.h
//  TRProject
//
//  Created by Wayne_Law on 16/8/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrowShowListTableViewController : UITableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style data:(NSString *)dataType;
@property (nonatomic, readonly) NSString *dataType;

@end
