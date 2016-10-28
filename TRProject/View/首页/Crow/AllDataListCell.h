//
//  AllDataListCell.h
//  TRProject
//
//  Created by Wayne_Law on 16/8/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllDataListCell : UITableViewCell

@property (nonatomic) UIImageView *showIV;
@property (nonatomic) UILabel     *titleLB;
@property (nonatomic) UIView      *canBookView;
@property (nonatomic) UILabel     *soldCountLB;
@property (nonatomic) UIImageView *locationIV;
@property (nonatomic) UILabel     *locationLB;
@property (nonatomic) UILabel     *marketPriceLB;
@property (nonatomic) UILabel     *salesPriceLB;
@property (nonatomic) UIView      *discountView;
@property (nonatomic) UILabel     *discountLB;

@end
