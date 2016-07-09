//
//  HomeCellOne.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/5.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "HomeCellOne.h"
#import <UIImageView+WebCache.h>

@implementation HomeCellOne

- (void)updateCellData:(DataModel *)model
{
    [self.titleL setText:model.title];
    [self.accountL setText:model.account_name];
    [self.pic sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
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
