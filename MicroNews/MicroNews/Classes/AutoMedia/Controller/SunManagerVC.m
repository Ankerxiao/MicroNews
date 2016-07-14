//
//  SunManagerVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/14.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "SunManagerVC.h"

@interface SunManagerVC ()
{
    BOOL _isFirst;
    UIButton *_gBtn;
}
@end

@implementation SunManagerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化各个成员变量
    _isFirst = YES;
    
    //左侧ScrollView
    [self createScrollView];
    
    //右侧tableView
    [self createTableView];
    
}

- (void)createScrollView
{
    NSArray *titleA = @[@"我的",@"推荐",@"笑话",@"美文",@"健康",@"娱乐",
                        @"社会",@"科技",@"体育",
                        @"生活",@"财经",@"汽车",@"探索",@"美食",@"职场",@"时尚",
                        @"旅游",@"育儿",@"教育",@"情感",@"星座",@"宠物"];
    UIScrollView *scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/5, SCREEN_HEIGHT-64)];
    NSInteger count = titleA.count;
    for(int i=0;i<count;i++)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, i*SCREEN_WIDTH/5, SCREEN_WIDTH/5, SCREEN_WIDTH/5)];
        [btn setTitle:titleA[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [scrollV addSubview:btn];
        if(i == 1)
        {
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            btn.tag = 7;
            _gBtn = btn;
        }
    }
    scrollV.showsVerticalScrollIndicator = NO;
    scrollV.contentSize = CGSizeMake(SCREEN_WIDTH/5, count*SCREEN_WIDTH/5);
    scrollV.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollV];
}

- (void)pressBtn:(UIButton *)button
{
    if([_gBtn isEqual:button])
    {
        return;
    }
    else
    {
        [_gBtn setBackgroundColor:[UIColor grayColor]];
        [_gBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        _gBtn = button;
    }
}

- (void)createTableView
{
    
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
