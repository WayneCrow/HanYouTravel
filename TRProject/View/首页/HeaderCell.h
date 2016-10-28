//
//  HeaderCell.h
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeaderCell;

@protocol HeaderCellDataSource <NSObject>
- (NSInteger)numberOfInCell:(HeaderCell *)cell;
- (NSURL *)imageURLOfInCell:(HeaderCell *)cell atIndex:(NSInteger)index;

@end



@protocol HeaderCellDelegate <NSObject>
- (void)headerCell:(HeaderCell *)cell didSelectedIconAtIndex:(NSInteger)index;

@end



@interface HeaderCell : UIView <iCarouselDelegate,iCarouselDataSource>
@property(nonatomic) iCarousel *ic;
@property(nonatomic) UIPageControl *pageC;
@property(nonatomic,weak) id<HeaderCellDelegate> delegate;
@property(nonatomic,weak) id<HeaderCellDataSource> dataSource;
@property (nonatomic) NSTimer        *timer;
@property (nonatomic) BOOL           autoScroll;
@property (nonatomic) NSTimeInterval duration;

@property(nonatomic) UIButton *mapBtn;
@property(nonatomic) UIButton *metroBtn;
@property(nonatomic) UIButton *rateBtn;
@property(nonatomic) UIButton *weatherBtn;
- (void)reloadData;



@end
