//
//  RootTabBarVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "RootTabBarVC.h"
#import "CreateTabBar.h"

@interface RootTabBarVC ()

@end

@implementation RootTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init
{
    if(self = [super init])
    {
        [self initTabBar];
    }
    return self;
}

- (void)initTabBar
{
    [self initTabBarVCs];
    [self initTabBarItems];
}

- (void)initTabBarVCs
{
    NSMutableArray *navArray = [NSMutableArray array];
    NSArray *className = @[@"HomeVC",@"RankVC",@"AutoMediaVC",@"MyVC"];
    for(int i=0;i<4;i++)
    {
        Class class = NSClassFromString([NSString stringWithFormat:@"%@",className[i]]);
        UIViewController *vc = [[class alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [navArray addObject:nav];
    }
    self.viewControllers = navArray;
}

- (void)initTabBarItems
{
    NSInteger count = [self.viewControllers count];
    for (int i = 0; i < count; i++)
    {
        UINavigationController *navTemp = self.viewControllers[i];
        UIViewController *vcTemp = [navTemp.viewControllers firstObject];
        vcTemp.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents+i tag:i];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
