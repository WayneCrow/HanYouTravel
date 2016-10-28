//
//  CrowTicketHeaderView.h
//  TRProject
//
//  Created by tarena11 on 16/8/11.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrowTicketHeaderView;

@protocol TicketHeaderDataSource <NSObject>

- (NSInteger)numberOfAdItem:(CrowTicketHeaderView *)adView;
- (NSURL *)imageURLForAdItem:(CrowTicketHeaderView *)adView atIndex:(NSInteger)index;

@end

@protocol TicketHeaderDelegate <NSObject>

- (void)headerAdView:(CrowTicketHeaderView *)adView didSelectedAtIndex:(NSInteger)index;

@end


@interface CrowTicketHeaderView : UIView<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic, weak) id<TicketHeaderDelegate> delegate;
@property (nonatomic, weak) id<TicketHeaderDataSource> dateSource;

@property (nonatomic) UISearchController *searchController;

@property (nonatomic) iCarousel      *ic;
@property (nonatomic) UIPageControl  *pageControl;
@property (nonatomic) NSTimer        *timer;
@property (nonatomic) BOOL           autoScroll;
@property (nonatomic) NSTimeInterval duration;

@property (nonatomic) UIButton *saunaButton;
@property (nonatomic) UIButton *foodButton;
@property (nonatomic) UIButton *paradiseButton;
@property (nonatomic) UIButton *landmarkButton;
@property (nonatomic) UIButton *shootButton;
@property (nonatomic) UIButton *pavilionButton;
@property (nonatomic) UIButton *cultureButton;
@property (nonatomic) UIButton *trafficButton;
@property (nonatomic) UIButton *skingButton;
@property (nonatomic) UIButton *allButton;


- (void)reloadData;

@end
