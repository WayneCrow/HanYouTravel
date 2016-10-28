//
//  ZeroCell.m
//  TRProject
//
//  Created by tarena11 on 16/8/11.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ZeroCell.h"

@implementation ZeroCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark - LazyLoad 懒加载
- (UIButton *)scenicBtn {
    if(_scenicBtn == nil) {
        _scenicBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_scenicBtn];
        
        [_scenicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(0);
            make.width.equalTo(self.contentView.bounds.size.width / 4);
            make.height.equalTo(self.width);
        }];
        
        [_scenicBtn setTitle:@"" forState:UIControlStateNormal];
        [_scenicBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_scenicBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
    }
    return _scenicBtn;
}

- (UIButton *)performBtn {
    if(_performBtn == nil) {
        _performBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_performBtn];
        
        [_performBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.equalTo(self.performBtn.mas_right);
            
        }];
        
        [_performBtn setTitle:@"" forState:UIControlStateNormal];
        [_performBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_performBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
    }
    return _performBtn;
}

- (UIButton *)wifiBtn {
    if(_wifiBtn == nil) {
        _wifiBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_wifiBtn];
        
        [_wifiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_wifiBtn setTitle:@"" forState:UIControlStateNormal];
        [_wifiBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_wifiBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
    }
    return _wifiBtn;
}

- (UIButton *)hotelBtn {
    if(_hotelBtn == nil) {
        _hotelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_hotelBtn];
        
        [_hotelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_hotelBtn setTitle:@"" forState:UIControlStateNormal];
        [_hotelBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_hotelBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
    }
    return _hotelBtn;
}

- (UIButton *)seckillBtn {
    if(_seckillBtn == nil) {
        _seckillBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_seckillBtn];
        
        [_seckillBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_seckillBtn setTitle:@"" forState:UIControlStateNormal];
        [_seckillBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_seckillBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
    }
    return _seckillBtn;
}

- (UIButton *)trainBtn {
    if(_trainBtn == nil) {
        _trainBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_trainBtn];
        
        [_trainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_trainBtn setTitle:@"" forState:UIControlStateNormal];
        [_trainBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_trainBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
    }
    return _trainBtn;
}

- (UIButton *)localBtn {
    if(_localBtn == nil) {
        _localBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_localBtn];
        
        [_localBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_localBtn setTitle:@"" forState:UIControlStateNormal];
        [_localBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_localBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
    }
    return _localBtn;
}

- (UIButton *)preferentialBtn {
    if(_preferentialBtn == nil) {
        _preferentialBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_preferentialBtn];
        
        [_preferentialBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_preferentialBtn setTitle:@"" forState:UIControlStateNormal];
        [_preferentialBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_preferentialBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
    }
    return _preferentialBtn;
}





- (UIButton *)raidersBtn {
    if(_raidersBtn == nil) {
        _raidersBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_scenicBtn];
        
        [_raidersBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_raidersBtn setTitle:@"" forState:UIControlStateNormal];
        [_raidersBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_raidersBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageTitleSpace:10];
    }
    return _raidersBtn;
}

- (UIButton *)cateBtn {
    if(_cateBtn == nil) {
        _cateBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_cateBtn];
        
        [_cateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_cateBtn setTitle:@"" forState:UIControlStateNormal];
        [_cateBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_cateBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageTitleSpace:10];
    }
    return _cateBtn;
}

- (UIButton *)referralBtn {
    if(_referralBtn == nil) {
        _referralBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_referralBtn];
        
        [_referralBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_referralBtn setTitle:@"" forState:UIControlStateNormal];
        [_referralBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_referralBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageTitleSpace:10];
    }
    return _referralBtn;
}

- (UIButton *)shopBtn {
    if(_shopBtn == nil) {
        _shopBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_shopBtn];
        
        [_shopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_shopBtn setTitle:@"" forState:UIControlStateNormal];
        [_shopBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_shopBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageTitleSpace:10];
    }
    return _shopBtn;
}

- (UIButton *)fashionBtn {
    if(_fashionBtn == nil) {
        _fashionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_fashionBtn];
        
        [_fashionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_fashionBtn setTitle:@"" forState:UIControlStateNormal];
        [_fashionBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_scenicBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageTitleSpace:10];
    }
    return _fashionBtn;
}

- (UIButton *)infoBtn {
    if(_infoBtn == nil) {
        _infoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_infoBtn];
        
        [_infoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [_infoBtn setTitle:@"" forState:UIControlStateNormal];
        [_infoBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_infoBtn layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleRight imageTitleSpace:10];
    }
    return _infoBtn;
}
@end
