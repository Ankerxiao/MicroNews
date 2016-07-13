//
//  HomeCell.h
//  MicroNews
//
//  Created by Anker Xiao on 16/7/5.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UIImageView *pic1;
@property (weak, nonatomic) IBOutlet UIImageView *pic2;
@property (weak, nonatomic) IBOutlet UIImageView *pic3;
@property (weak, nonatomic) IBOutlet UILabel *accountL;
@property (weak, nonatomic) IBOutlet UILabel *titleL2;
@property (weak, nonatomic) IBOutlet UILabel *accountL2;
@property (weak, nonatomic) IBOutlet UIImageView *picture2;
@property (weak, nonatomic) IBOutlet UIImageView *shareImage;

- (void)updateCellData:(DataModel *)model;

@end
