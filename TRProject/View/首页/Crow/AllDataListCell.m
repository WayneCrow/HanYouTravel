//
//  AllDataListCell.m
//  TRProject
//
//  Created by Wayne_Law on 16/8/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "AllDataListCell.h"

@implementation AllDataListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIImageView *)showIV {
    if(_showIV == nil) {
        _showIV = [[UIImageView alloc] init];
        [self addSubview:_showIV];
        [_showIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(8);
            make.bottom.equalTo(-8);
            make.width.equalTo(self.showIV.mas_height);
        }];
        _showIV.contentMode   = UIViewContentModeScaleAspectFill;
        _showIV.clipsToBounds = YES;
    }
    return _showIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.showIV);
            make.left.equalTo(self.showIV.mas_right).equalTo(8);
            make.right.greaterThanOrEqualTo(8);
        }];
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.font          = [UIFont systemFontOfSize:18];
    }
    return _titleLB;
}

- (UIView *)canBookView {
    if(_canBookView == nil) {
        _canBookView = [[UIView alloc] init];
        [self addSubview:_canBookView];
        [_canBookView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(50, 14));
            make.top.equalTo(self.titleLB.mas_bottom).equalTo(4);
            make.left.equalTo(self.titleLB);
        }];
        _canBookView.layer.cornerRadius  = 3;
        _canBookView.layer.masksToBounds = YES;
        _canBookView.layer.borderColor   = [UIColor orangeColor].CGColor;
        _canBookView.layer.borderWidth   = 1;
        
        UILabel *canBookLB = [UILabel new];
        [self.canBookView addSubview:canBookLB];
        [canBookLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.canBookView);
        }];
        canBookLB.text          = @"可订今日票";
        canBookLB.textAlignment = NSTextAlignmentCenter;
        canBookLB.font          = [UIFont systemFontOfSize:8];
        canBookLB.textColor     = [UIColor orangeColor];
    }
    return _canBookView;
}

- (UILabel *)soldCountLB {
    if(_soldCountLB == nil) {
        _soldCountLB = [[UILabel alloc] init];
        [self addSubview:_soldCountLB];
        [_soldCountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB);
            make.top.equalTo(self.canBookView.mas_bottom).equalTo(4);
        }];
        _soldCountLB.textAlignment = NSTextAlignmentLeft;
        _soldCountLB.font          = [UIFont systemFontOfSize:14];
        _soldCountLB.textColor     = [UIColor darkGrayColor];
    }
    return _soldCountLB;
}

- (UIImageView *)locationIV {
    if(_locationIV == nil) {
        _locationIV = [[UIImageView alloc] init];
        [self addSubview:_locationIV];
        [_locationIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB);
            make.top.equalTo(self.soldCountLB.mas_bottom).equalTo(4);
            make.bottom.equalTo(-8);
            make.size.equalTo(CGSizeMake(10, 10));
        }];
        _locationIV.image               = [UIImage imageNamed:@"ticket_list_place"];
        _locationIV.contentMode         = UIViewContentModeScaleAspectFit;
        _locationIV.layer.masksToBounds = YES;
    }
    return _locationIV;
}

- (UILabel *)locationLB {
    if(_locationLB == nil) {
        _locationLB = [[UILabel alloc] init];
        [self addSubview:_locationLB];
        [_locationLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.locationIV);
            make.left.equalTo(self.locationIV.mas_right).equalTo(8);
            make.bottom.equalTo(self.locationIV);
        }];
        
        _locationLB.textAlignment = NSTextAlignmentLeft;
        _locationLB.tintColor     = [UIColor darkGrayColor];
        _locationLB.font          = [UIFont systemFontOfSize:14];
    }
    return _locationLB;
}

- (UILabel *)marketPriceLB {
    if(_marketPriceLB == nil) {
        _marketPriceLB = [[UILabel alloc] init];
        [self addSubview:_marketPriceLB];
        [_marketPriceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.canBookView);
            make.right.equalTo(-8);
        }];
        
        _marketPriceLB.textAlignment = NSTextAlignmentRight;
        _marketPriceLB.textColor     = [UIColor grayColor];
        _marketPriceLB.font          = [UIFont systemFontOfSize:12];
        
        UIView *lineView = [UIView new];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.marketPriceLB);
            make.height.equalTo(2);
            make.width.equalTo(self.marketPriceLB);
        }];
        lineView.backgroundColor = [UIColor grayColor];
    }
    return _marketPriceLB;
}

- (UILabel *)salesPriceLB {
    if(_salesPriceLB == nil) {
        UILabel *moneyIconLB = [UILabel new];
        [self addSubview:moneyIconLB];
        [moneyIconLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.soldCountLB);
        }];
        moneyIconLB.text          = @"￥";
        moneyIconLB.textAlignment = NSTextAlignmentCenter;
        moneyIconLB.textColor     = [UIColor colorWithRed:250 / 255.0 green:90 / 255.0 blue:0 / 255.0 alpha:1];
        moneyIconLB.font          = [UIFont systemFontOfSize:12];
        [moneyIconLB sizeToFit];
        
        _salesPriceLB = [[UILabel alloc] init];
        [self addSubview:_salesPriceLB];
        [_salesPriceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(moneyIconLB.mas_right).equalTo(4);
            make.bottom.equalTo(moneyIconLB);
        }];
        _salesPriceLB.textAlignment = NSTextAlignmentCenter;
        _salesPriceLB.textColor     = [UIColor colorWithRed:250 / 255.0 green:90 / 255.0 blue:0 / 255.0 alpha:1];
        _salesPriceLB.font          = [UIFont systemFontOfSize:14];
        [_salesPriceLB sizeToFit];
        
        UILabel *costFormLB = [UILabel new];
        [self addSubview:costFormLB];
        [costFormLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.salesPriceLB.mas_right).equalTo(4);
            make.bottom.equalTo(self.salesPriceLB);
            make.right.equalTo(-8);
        }];
        costFormLB.text          = @"起";
        costFormLB.textAlignment = NSTextAlignmentCenter;
        costFormLB.textColor     = [UIColor grayColor];
        costFormLB.font          = [UIFont systemFontOfSize:12];
        [costFormLB sizeToFit];
    }
    return _salesPriceLB;
}

- (UIView *)discountView {
    if(_discountView == nil) {
        _discountView = [[UIView alloc] init];
        [self addSubview:_discountView];
        [_discountView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.salesPriceLB.mas_bottom).equalTo(4);
            make.right.equalTo(-8);
            make.size.equalTo(CGSizeMake(36, 14));
        }];
        _discountView.layer.cornerRadius  = 3;
        _discountView.layer.masksToBounds = YES;
        _discountView.layer.borderColor   = [UIColor orangeColor].CGColor;
        _discountView.layer.borderWidth   = 1;
    }
    return _discountView;
}

- (UILabel *)discountLB {
    if(_discountLB == nil) {
        _discountLB = [[UILabel alloc] init];
        [self addSubview:_discountLB];
        [_discountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.discountView);
        }];
        _discountLB.textAlignment = NSTextAlignmentCenter;
        _discountLB.textColor     = [UIColor orangeColor];
        _discountLB.font          = [UIFont systemFontOfSize:12];
        [_discountLB sizeToFit];
    }
    return _discountLB;
}

@end
