//
//  TabBarViewController.m
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "IndentViewController.h"
#import "MapViewController.h"
#import "MineViewController.h"
#import "FindViewController.h"
@interface TabBarViewController ()
@property(nonatomic) HomeViewController *homeVC;
@property(nonatomic) IndentViewController *indentVC;
@property(nonatomic) MapViewController *mapVC;
@property(nonatomic) MineViewController *mineVC;
@property(nonatomic) FindViewController *findVC;
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = kGreenColor;
    
    UINavigationController *navi0 = [[UINavigationController alloc]initWithRootViewController:self.homeVC];
    UINavigationController *navi1 = [[UINavigationController alloc]initWithRootViewController:self.indentVC];
    UINavigationController *navi2 = [[UINavigationController alloc]initWithRootViewController:self.mapVC];
    UINavigationController *navi3 = [[UINavigationController alloc]initWithRootViewController:self.mineVC];
    UINavigationController *navi4 = [[UINavigationController alloc]initWithRootViewController:self.findVC];
    
    self.viewControllers = @[navi0,navi1,navi2,navi4,navi3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (HomeViewController *)homeVC {
	if(_homeVC == nil) {
		_homeVC = [[HomeViewController alloc] init];
        _homeVC.title = @"首页";
        _homeVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_index"];
        _homeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_tab_active_index"];
	}
	return _homeVC;
}

- (IndentViewController *)indentVC {
	if(_indentVC == nil) {
		_indentVC = [[IndentViewController alloc] init];
        _indentVC.title = @"订单";
        _indentVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_order"];
        _indentVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_tab_active_order"];
	}
	return _indentVC;
}

- (MapViewController *)mapVC {
	if(_mapVC == nil) {
		_mapVC = [[MapViewController alloc] init];
        _mapVC.title = @"地图";
        _mapVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_map"];
        _mapVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_tab_active_map"];
	}
	return _mapVC;
}

- (MineViewController *)mineVC {
	if(_mineVC == nil) {
		_mineVC = [[MineViewController alloc] init];
        _mineVC.title = @"我的";
        _mineVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_member"];
        _mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_tab_active_member"];
	}
	return _mineVC;
}

- (FindViewController *)findVC {
	if(_findVC == nil) {
		_findVC = [[FindViewController alloc] init];
        _findVC.title = @"发现";
        _findVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_find"];
        _findVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_tab_active_find"];
	}
	return _findVC;
}

@end
