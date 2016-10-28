//
//  CrowTicketHeaderView.m
//  TRProject
//
//  Created by tarena11 on 16/8/11.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "CrowTicketHeaderView.h"

@implementation CrowTicketHeaderView

#pragma mark - LifeCycle (生命周期)

- (instancetype)initWithFrame:(CGRect)frame
{
    CGFloat width = frame.size.width;
    CGFloat height = (width * 226 / 720) + (width / 5 * 2);
    
    self = [super initWithFrame:CGRectMake(0, 0, width, height)];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _duration = 2.0;
        self.autoScroll = YES;
    }
    return self;
}

- (void)setDuration:(NSTimeInterval)duration {
    
    _duration = duration;
    
    self.autoScroll = _autoScroll;
}

- (void)setAutoScroll:(BOOL)autoScroll {
    
    _autoScroll = autoScroll;
    
    if (autoScroll) {
        [_timer invalidate];
        
        _timer = nil;
        
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
    }
}

#pragma mark - ic Delegate

- (void)reloadData {
    [self.ic reloadData];
    
    if ([_dateSource respondsToSelector:@selector(numberOfAdItem:)]) {
        self.pageControl.numberOfPages = [_dateSource numberOfAdItem:self];
    }
    self.pageControl.currentPage = _ic.currentItemIndex;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dateSource respondsToSelector:@selector(numberOfAdItem:)]) {
        return [_dateSource numberOfAdItem:self];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        
        view.contentMode   = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dateSource respondsToSelector:@selector(imageURLForAdItem:atIndex:)]) {
        NSURL *imageURL = [_dateSource imageURLForAdItem:self atIndex:index];
        [((UIImageView *)view) setImageURL:imageURL];
    }
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    self.pageControl.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    if ([_delegate respondsToSelector:@selector(headerAdView:didSelectedAtIndex:)]) {
        [_delegate headerAdView:self didSelectedAtIndex:index];
    }
}

#pragma mark - LazyLoad (懒加载) 

- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];

        _ic.delegate    = self;
        _ic.dataSource  = self;
        _ic.scrollSpeed = 0.2;
        
        [self addSubview:_ic];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = (width * 226 / 720);
        
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.equalTo(0);
            make.height.equalTo(height);
        }];
    }
    return _ic;
}

- (UIPageControl *)pageControl {
    if(_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        
        [self addSubview:_pageControl];
        
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.ic.mas_bottom).equalTo(8);
            make.centerX.equalTo(0);
        }];
    }
    return _pageControl;
}

- (UIButton *)saunaButton {
    if(_saunaButton == nil) {
        _saunaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_saunaButton];
        CGFloat width = ([UIScreen mainScreen].bounds.size.width * 0.2);
        [_saunaButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.left.equalTo(0);
            make.size.equalTo(CGSizeMake(width, width));
        }];
        
        [_saunaButton setTitle:@"桑拿汗蒸" forState:UIControlStateNormal];
        [_saunaButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _saunaButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_saunaButton setImage:[UIImage imageNamed:@"Sauna"] forState:UIControlStateNormal];
        [_saunaButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _saunaButton;
}

- (UIButton *)foodButton {
    if(_foodButton == nil) {
        _foodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_foodButton];
        [_foodButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.left.equalTo(self.saunaButton.mas_right);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_foodButton setTitle:@"餐饮美食" forState:UIControlStateNormal];
        [_foodButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _foodButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_foodButton setImage:[UIImage imageNamed:@"Food"] forState:UIControlStateNormal];
        [_foodButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _foodButton;
}

- (UIButton *)paradiseButton {
    if(_paradiseButton == nil) {
        _paradiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_paradiseButton];
        [_paradiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.left.equalTo(self.foodButton.mas_right);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_paradiseButton setTitle:@"主题乐园" forState:UIControlStateNormal];
        [_paradiseButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _paradiseButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_paradiseButton setImage:[UIImage imageNamed:@"Paradise"] forState:UIControlStateNormal];
        [_paradiseButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _paradiseButton;
}

- (UIButton *)landmarkButton {
    if(_landmarkButton == nil) {
        _landmarkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_landmarkButton];
        [_landmarkButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.left.equalTo(self.paradiseButton.mas_right);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_landmarkButton setTitle:@"地标建筑" forState:UIControlStateNormal];
        [_landmarkButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _landmarkButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_landmarkButton setImage:[UIImage imageNamed:@"Landmark"] forState:UIControlStateNormal];
        [_landmarkButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _landmarkButton;
}

- (UIButton *)shootButton {
    if(_shootButton == nil) {
        _shootButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_shootButton];
        [_shootButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.left.equalTo(self.landmarkButton.mas_right);
            make.right.equalTo(0);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_shootButton setTitle:@"韩剧拍摄" forState:UIControlStateNormal];
        [_shootButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _shootButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shootButton setImage:[UIImage imageNamed:@"Shoot"] forState:UIControlStateNormal];
        [_shootButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _shootButton;
}

- (UIButton *)pavilionButton {
    if(_pavilionButton == nil) {
        _pavilionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_pavilionButton];
        [_pavilionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.saunaButton.mas_bottom);
            make.left.equalTo(0);
            make.bottom.equalTo(0);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_pavilionButton setTitle:@"特色展馆" forState:UIControlStateNormal];
        [_pavilionButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _pavilionButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_pavilionButton setImage:[UIImage imageNamed:@"Pavilion"] forState:UIControlStateNormal];
        [_pavilionButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _pavilionButton;
}

- (UIButton *)cultureButton {
    if(_cultureButton == nil) {
        _cultureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_cultureButton];
        [_cultureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pavilionButton);
            make.left.equalTo(self.pavilionButton.mas_right);
            make.bottom.equalTo(0);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_cultureButton setTitle:@"文化体验" forState:UIControlStateNormal];
        [_cultureButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _cultureButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_cultureButton setImage:[UIImage imageNamed:@"Culture"] forState:UIControlStateNormal];
        [_cultureButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _cultureButton;
}

- (UIButton *)trafficButton {
    if(_trafficButton == nil) {
        _trafficButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_trafficButton];
        [_trafficButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pavilionButton);
            make.left.equalTo(self.cultureButton.mas_right);
            make.bottom.equalTo(0);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_trafficButton setTitle:@"交通观光" forState:UIControlStateNormal];
        [_trafficButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _trafficButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_trafficButton setImage:[UIImage imageNamed:@"Tranffic"] forState:UIControlStateNormal];
        [_trafficButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _trafficButton;
}

- (UIButton *)skingButton {
    if(_skingButton == nil) {
        _skingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_skingButton];
        [_skingButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pavilionButton);
            make.left.equalTo(self.trafficButton.mas_right);
            make.bottom.equalTo(0);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_skingButton setTitle:@"温泉滑雪" forState:UIControlStateNormal];
        [_skingButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _skingButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_skingButton setImage:[UIImage imageNamed:@"Sking"] forState:UIControlStateNormal];
        [_skingButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _skingButton;
}

- (UIButton *)allButton {
    if(_allButton == nil) {
        _allButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_allButton];
        [_allButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pavilionButton);
            make.left.equalTo(self.skingButton.mas_right);
            make.bottom.equalTo(0);
            make.size.equalTo(self.saunaButton);
        }];
        
        [_allButton setTitle:@"全部" forState:UIControlStateNormal];
        [_allButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _allButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_allButton setImage:[UIImage imageNamed:@"All"] forState:UIControlStateNormal];
        [_allButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:16];
    }
    return _allButton;
}

@end
