//
//  MySub.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/11.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "MySub.h"

@implementation MySub

- (instancetype)init
{
    if(self = [super init])
    {
        [self createView];
    }
    return self;
}

- (void)createView
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 40, 20)];
    [btn setTitle:@"添加订阅" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self addSubview:btn];
}

@end
