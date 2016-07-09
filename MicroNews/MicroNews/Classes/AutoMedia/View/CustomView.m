//
//  CustomView.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/9.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    NSInteger margin = (SCREEN_WIDTH-270)/4;
    if(self = [super initWithFrame:frame])
    {
        self.imageV = [[UIImageView alloc] init];
        self.imageV.frame = CGRectMake(margin, margin, 90, 90);
        [self addSubview:self.imageV];
        
        self.titleL = [[UILabel alloc] init];
        self.titleL.frame = CGRectMake(0, 0, self.imageV.frame.size.width, 50);
        self.titleL.center = CGPointMake(self.imageV.frame.origin.x+40, CGRectGetMaxY(self.imageV.frame)+20);
        [self addSubview:self.titleL];
    }
    return self;
}

@end
