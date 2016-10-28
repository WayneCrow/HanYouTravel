//
//  CrowTicketTableViewController.m
//  TRProject
//
//  Created by tarena11 on 16/8/11.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "CrowTicketTableViewController.h"
#import "CrowHeaderViewModel.h"
#import "CrowTicketHeaderView.h"
#import "CrowShowListTableViewController.h"

@interface CrowTicketTableViewController ()<TicketHeaderDelegate,TicketHeaderDataSource>

@property(nonatomic) CrowHeaderViewModel *headerVM;
@property (nonatomic) CrowTicketHeaderView *headerView;

@end

@implementation CrowTicketTableViewController

#pragma mark - LifeCycle (生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    
    [self.headerVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
        weakSelf.tableView.tableHeaderView = weakSelf.headerView;
        [weakSelf.headerView reloadData];
        [weakSelf.tableView endHeaderRefresh];
    }];
    
    [self.headerView.saunaButton bk_addEventHandler:^(id sender) {
        NSLog(@"桑拿");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.foodButton bk_addEventHandler:^(id sender) {
        NSLog(@"美食");
        [self.navigationController pushViewController:[[CrowShowListTableViewController alloc] initWithStyle:UITableViewStylePlain data:@"美食"] animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.paradiseButton bk_addEventHandler:^(id sender) {
        NSLog(@"乐园");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.landmarkButton bk_addEventHandler:^(id sender) {
        NSLog(@"地标");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.shootButton bk_addEventHandler:^(id sender) {
        NSLog(@"拍摄");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.pavilionButton bk_addEventHandler:^(id sender) {
        NSLog(@"展馆");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.cultureButton bk_addEventHandler:^(id sender) {
        NSLog(@"文化");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.trafficButton bk_addEventHandler:^(id sender) {
        NSLog(@"交通");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.skingButton bk_addEventHandler:^(id sender) {
        NSLog(@"滑雪");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.allButton bk_addEventHandler:^(id sender) {
        NSLog(@"全部");
    } forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HeaderView Delegate 

- (NSInteger)numberOfAdItem:(CrowTicketHeaderView *)adView {
    return self.headerVM.adNumber;
}

- (NSURL *)imageURLForAdItem:(CrowTicketHeaderView *)adView atIndex:(NSInteger)index {
    return [self.headerVM imageURL:index];
}

- (void)headerAdView:(CrowTicketHeaderView *)adView didSelectedAtIndex:(NSInteger)index {
    NSLog(@"跳转网页");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    
//    
//    return cell;
//}


#pragma mark - LazyLoad (懒加载)

- (CrowHeaderViewModel *)headerVM {
	if(_headerVM == nil) {
		_headerVM = [[CrowHeaderViewModel alloc] init];
	}
	return _headerVM;
}

- (CrowTicketHeaderView *)headerView {
	if(_headerView == nil) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = (width * 226 / 720) + (width / 5 * 2);
        
		_headerView = [[CrowTicketHeaderView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        _headerView.delegate   = self;
        _headerView.dateSource = self;
	}
	return _headerView;
}

@end
