//
//  Login_RegisterVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/15.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "Login_RegisterVC.h"
#import "LoginVC.h"

@interface Login_RegisterVC ()

@end

@implementation Login_RegisterVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    [self initSubViews];
}

- (void)initSubViews
{
    LoginVC *lvc = [[LoginVC alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:lvc animated:YES];
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
