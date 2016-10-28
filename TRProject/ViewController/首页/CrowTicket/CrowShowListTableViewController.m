//
//  CrowShowListTableViewController.m
//  TRProject
//
//  Created by Wayne_Law on 16/8/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "CrowShowListTableViewController.h"
#import "AllDataListCell.h"
#import "DetailListViewModel.h"

@interface CrowShowListTableViewController ()

@property (nonatomic) DetailListViewModel *detailListVM;

@end

@implementation CrowShowListTableViewController

#pragma mark - LifeCycle (生命周期)

- (instancetype)initWithStyle:(UITableViewStyle)style data:(NSString *)dataType
{
    self = [super initWithStyle:style];
    if (self) {
        _dataType = dataType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[AllDataListCell class] forCellReuseIdentifier:@"Cell"];
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addHeaderRefresh:^{
        
        [weakSelf.detailListVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFooterRefresh:^{
        [weakSelf.detailListVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.detailListVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AllDataListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.showIV setImageURL:[self.detailListVM showImageForRow:indexPath.row]];
    cell.titleLB.text = [self.detailListVM titleForRow:indexPath.row];
    if ([self.detailListVM isCanBookForRow:indexPath.row] == 1) {
        [cell canBookView];
    }
    cell.soldCountLB.text   = [self.detailListVM soldCountForRow:indexPath.row];
    cell.locationLB.text    = [self.detailListVM locationForRow:indexPath.row];
    cell.marketPriceLB.text = [self.detailListVM markPriceForRow:indexPath.row];
    cell.salesPriceLB.text  = [self.detailListVM salesPriceFowRow:indexPath.row];
    cell.discountLB.text    = [self.detailListVM discountForRow:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - LazyLoad (懒加载)

- (DetailListViewModel *)detailListVM {
	if(_detailListVM == nil) {
		_detailListVM = [[DetailListViewModel alloc] init];
	}
	return _detailListVM;
}

@end
