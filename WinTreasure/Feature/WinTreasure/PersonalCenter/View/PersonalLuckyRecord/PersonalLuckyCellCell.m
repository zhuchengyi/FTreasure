//
//  PersonalLuckyCellCell.m
//  WinTreasure
//
//  Created by Apple on 16/6/14.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "PersonalLuckyCellCell.h"

@implementation PersonalLuckyCellCell

- (void)awakeFromNib {
    [super awakeFromNib];

    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"PersonalLuckyCellCell";
    PersonalLuckyCellCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = (PersonalLuckyCellCell *)[[[NSBundle mainBundle] loadNibNamed:@"PersonalLuckyCellCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setModel:(LuckyRecordModel *)model {
    _model = model;
    [_productImageView setImageWithURL:[NSURL URLWithString:_model.productImgUrl] options:YYWebImageOptionShowNetworkActivity];
    _productNameLabel.text = _model.productName;
    _periodNoLabel.text = [NSString stringWithFormat:@"期号：%@",_model.productPeriodNo];
    _luckyNoLabel.text = [NSString stringWithFormat:@"幸运号码：%@",_model.productLuckyNo];
    _totalLabel.text = [NSString stringWithFormat:@"本期参与：%@",_model.productPartInAmount];
    _publishTimeLabel.text = [NSString stringWithFormat:@"揭晓时间：%@",_model.productPublishTime];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
