//
//  AppSub.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/9.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "AppSub.h"
#import <UIImageView+WebCache.h>
#import "DatabaseManager.h"

@interface AppSub ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *subsAndGoodRateL;
@property (weak, nonatomic) IBOutlet UILabel *desc;


@end

@implementation AppSub

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(DataModel *)model
{
    _model = model;
    
    self.imageV.layer.cornerRadius = 10;
    self.imageV.layer.masksToBounds = YES;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.nameL.text = model.name;
    self.subsAndGoodRateL.text = [NSString stringWithFormat:@"%@关注  好评:%@%%",model.subs,model.good_rate];
    self.desc.text = model.descrip;
}

#pragma mark 添加订阅，存入数据库
- (IBAction)pressBtn:(id)sender
{
    NSLog(@"eh---------");
    //数据库操作
    DatabaseManager *dbm = [DatabaseManager sharedDatabaseManager];
    dbm = [[DatabaseManager alloc] initWithDBName:@"sub.db" andTableName:@"subm" andField:@"imageUrl",@"name",@"content",nil];
    [dbm insertDataWithArray:@[@[self.model.avatar,self.nameL.text,self.desc.text]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
