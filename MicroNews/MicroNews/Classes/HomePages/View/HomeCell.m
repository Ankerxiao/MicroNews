//
//  HomeCell.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/5.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "HomeCell.h"
#import <UIImageView+WebCache.h>

@implementation HomeCell

- (void)updateCellData:(DataModel *)model
{
    [self.titleL setText:model.title];
    [self.accountL setText:model.account_name];
    NSArray *picArray = model.extra;
    [self.pic1 sd_setImageWithURL:[NSURL URLWithString:picArray[0]]];
    [self.pic2 sd_setImageWithURL:[NSURL URLWithString:picArray[1]]];
    [self.pic3 sd_setImageWithURL:[NSURL URLWithString:picArray[2]]];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
