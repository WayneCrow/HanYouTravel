//
//  HeaderCell.m
//  TRProject
//
//  Created by tarena11 on 16/8/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell
- (void)setDuration:(NSTimeInterval)duration {
    _duration = duration;
    self.autoScroll = _autoScroll;//当图片滚动时才滚动
}
- (void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    [_timer invalidate];//让定时器失效
    _timer = nil;//使滚动失效
    
    if (autoScroll) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        }repeats:YES];
    }
}
- (void)reloadData {
    [self.ic reloadData];
    if ([_dataSource respondsToSelector:@selector(numberOfInCell:)]) {
        [_dataSource numberOfInCell:self];
        
        [self pageC];
    }
}


//iCarousel代理
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(numberOfInCell:)]) {
        return [_dataSource numberOfInCell:self];
    }
    return 0;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIImageView alloc]initWithFrame:carousel.bounds];
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSource respondsToSelector:@selector(imageURLOfInCell:atIndex:)]) {
        NSURL *iconURL = [_dataSource imageURLOfInCell:self atIndex:index];
        [((UIImageView *)view)setImageURL:iconURL];
    }
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    if ([_delegate respondsToSelector:@selector(headerCell:didSelectedIconAtIndex:)]) {
        [_delegate headerCell:self didSelectedIconAtIndex:index];
    }
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    self.pageC.currentPage = carousel.currentItemIndex;
}



#pragma mark - LazyLoad 懒加载
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self mapBtn];
        [self metroBtn];
        [self rateBtn];
        [self weatherBtn];
    }
    return self;
}
- (iCarousel *)ic {
    if (_ic == nil) {
        _ic = [iCarousel new];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = .2;
        [self addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(160);
        }];
    }
    return _ic;
}

- (UIPageControl *)pageC {
    if (_pageC == nil) {
        _pageC = [UIPageControl new];
        self.pageC.numberOfPages = [_dataSource numberOfInCell:self];
        self.pageC.currentPage = _ic.currentItemIndex;
        self.pageC.pageIndicatorTintColor = [UIColor grayColor];
        self.pageC.currentPageIndicatorTintColor = [UIColor whiteColor];
        _duration = 2;
        self.autoScroll = YES;
        [self.ic addSubview:_pageC];
        [_pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.centerX.equalTo(0);
        }];
    }
    return _pageC;
}

- (UIButton *)mapBtn {
    if(_mapBtn == nil) {
        _mapBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_mapBtn];
        [_mapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.bottom.left.equalTo(0);
            make.width.equalTo((long)(self.bounds.size.width-3) / 4);
        }];
        _mapBtn.tintColor = [UIColor grayColor];
        [_mapBtn setTitle:@"地图" forState:UIControlStateNormal];
        [_mapBtn setImage:[UIImage imageNamed:@"home_map"] forState:UIControlStateNormal];
        [_mapBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleBottom imageTitleSpace:10];
    }
    return _mapBtn;
}

- (UIButton *)metroBtn {
    if(_metroBtn == nil) {
        _metroBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_metroBtn];
        [_metroBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mapBtn.mas_right).equalTo(1);
            make.top.equalTo(self.ic.mas_bottom);
            make.bottom.equalTo(0);
            make.width.equalTo(self.mapBtn);
        }];
        _metroBtn.tintColor = [UIColor grayColor];
        [_metroBtn setTitle:@"地铁" forState:UIControlStateNormal];
        [_metroBtn setImage:[UIImage imageNamed:@"home_metro"] forState:UIControlStateNormal];
        [_metroBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleBottom imageTitleSpace:10];
    }
    return _metroBtn;
}

- (UIButton *)rateBtn {
    if(_rateBtn == nil) {
        _rateBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_rateBtn];
        [_rateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.metroBtn.mas_right).equalTo(1);
            make.top.equalTo(self.ic.mas_bottom);
            make.bottom.equalTo(0);
            make.width.equalTo(self.metroBtn);
        }];
        _rateBtn.tintColor = [UIColor grayColor];
        [_rateBtn setTitle:@"汇率" forState:UIControlStateNormal];
        [_rateBtn setImage:[UIImage imageNamed:@"home_rate"] forState:UIControlStateNormal];
        [_rateBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleBottom imageTitleSpace:25];
    }
    return _rateBtn;
}
#warning 动态数据，目前死数据
- (UIButton *)weatherBtn {
    if(_weatherBtn == nil) {
        _weatherBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_weatherBtn];
        [_weatherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.rateBtn.mas_right).equalTo(1);
            make.top.equalTo(self.ic.mas_bottom);
            make.bottom.equalTo(0);
            make.width.equalTo(self.rateBtn);
        }];
        _weatherBtn.tintColor = [UIColor grayColor];
        [_weatherBtn setTitle:@"天气" forState:UIControlStateNormal];
        [_weatherBtn setImage:[UIImage imageNamed:@"home_weather_32"] forState:UIControlStateNormal];
        [_weatherBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleBottom imageTitleSpace:25];
    }
    return _weatherBtn;
}
@end
