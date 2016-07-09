//
//  HomeCellOne.h
//  MicroNews
//
//  Created by Anker Xiao on 16/7/5.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface HomeCellOne : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *accountL;
@property (weak, nonatomic) IBOutlet UIImageView *pic;

- (void)updateCellData:(DataModel *)model;

@end
