//
//  HomeViewController.m
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "HomeViewController.h"
#import "HeaderCell.h"
#import "HeaderViewModel.h"
#import "CrowTicketTableViewController.h"

@interface HomeViewController ()<HeaderCellDelegate,HeaderCellDataSource>
@property(nonatomic) HeaderViewModel *headerVM;
@property(nonatomic) HeaderCell *HV;
@end

@implementation HomeViewController

#pragma mark - LazyLoad 懒加载
- (HeaderViewModel *)headerVM {
    if(_headerVM == nil) {
        _headerVM = [[HeaderViewModel alloc] init];
    }
    return _headerVM;
}
- (HeaderCell *)HV {
    if (_HV == nil) {
        _HV = [[HeaderCell alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 240)];
        _HV.delegate = self;
        _HV.dataSource = self;
        _HV.duration = 3;
    }
    return _HV;
}



#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
#warning Header点击事件未完成
    //头的Button点击事件
    [self.HV.mapBtn bk_addEventHandler:^(id sender) {
        NSLog(@"地图被点击");
        
        CrowTicketTableViewController *vc = [[CrowTicketTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.HV.metroBtn bk_addEventHandler:^(id sender) {
        NSLog(@"地铁被点击");
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.HV.rateBtn bk_addEventHandler:^(id sender) {
        NSLog(@"汇率被点击");
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.HV.weatherBtn bk_addEventHandler:^(id sender) {
        NSLog(@"天气被点击");
    } forControlEvents:UIControlEventTouchUpInside];
    //刷新
    __weak typeof(self)weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.headerVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            weakSelf.tableView.tableHeaderView = weakSelf.HV;
            [weakSelf.HV reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addFooterRefresh:^{
        [weakSelf.headerVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
}



//Header代理
- (NSInteger)numberOfInCell:(HeaderCell *)cell {
    return self.headerVM.rowNumber;
}

- (NSURL *)imageURLOfInCell:(HeaderCell *)cell atIndex:(NSInteger)index {
    return [self.headerVM imageURL:index];
}
#warning Header头未完成
- (void)headerCell:(HeaderCell *)cell didSelectedIconAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 1;
//}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    return nil;
//}





@end
