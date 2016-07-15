//
//  MyVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "MyVC.h"
#import "LoginVC.h"

@interface MyVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableV;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *picArray;

@end

@implementation MyVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableV];
}

- (UITableView *)tableV
{
    if(nil == _tableV)
    {
        _tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-64) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
    }
    return _tableV;
}

- (NSArray *)dataArray
{
    if(nil == _dataArray)
    {
        _dataArray = [NSArray array];
        _dataArray = @[@[],
                       @[@"邀请码"],
                       @[@"我的收藏",@"历史阅读"],
                       @[@"任务中心",@"兑换中心",@"收支明细"],
                       @[@"有奖反馈",@"五星好评",@"兴趣选择",@"设置"]];
    }
    return _dataArray;
}

- (NSArray *)picArray
{
    if(nil == _picArray)
    {
        _picArray = [NSArray array];
        _picArray = @[@[],@[@"user_number_icon"],@[@"user_collect_icon",@"user_coin_icon"],@[@"user_task_icon",@"user_exchange_icon",@"user_detail_icon"],@[@"user_opinion_icon",@"user_good_icon",@"user_interest_icon_new",@"user_set_icon"]];
    }
    return _picArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section != 0)
    {
        return [self.dataArray[section] count];
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section != 0)
    {
        return 44;
    }
    return 86;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cellID";
    if(indexPath.section == 0)
    {
        static NSString *str2 = @"cell";
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:str2];
        if(!cell2)
        {
        cell2 = [[[NSBundle mainBundle] loadNibNamed:@"OneCell" owner:nil options:nil] lastObject];
        return cell2;
        }
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        }
        if(indexPath.section == 1)
        {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"输入好友验证码获得2元奖励"];
            NSString *str = @"输入好友验证码获得2元奖励";
            NSRange range = [str rangeOfString:@"2元"];
            NSRange range2 = [str rangeOfString:str];
            [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range2];
            [attr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
            cell.detailTextLabel.attributedText = attr;
        }
        if(indexPath.section == 3 && indexPath.row == 0)
        {
            UIImage *image = [UIImage imageNamed:@"user_new_icon"];
            UIImage *image2 = [UIImage imageNamed:@"user_mark_icon"];
            UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3+15, 0, 75, 20)];
            UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
            imageV.frame = CGRectMake(18, 0, 40, 20);
            UIImageView *imageV2 = [[UIImageView alloc] initWithImage:image2];
            imageV2.frame = CGRectMake(CGRectGetMaxX(imageV.frame)+2, 0, 20, 20);
            [vw addSubview:imageV];
            [vw addSubview:imageV2];
            cell.accessoryView = vw;
        }
        cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
        cell.imageView.image = [UIImage imageNamed:self.picArray[indexPath.section][indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;

    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 1)
    {
        return 0;
    }
    return 10;
}



- (UIView *)tableHeaderView
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 80)];
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_header_icon"]];
    imageV.frame = CGRectMake(10, 10, 55, 55);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame)+10, imageV.center.y-12, 180, 20)];
    label.text = @"未登录";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), label.frame.origin.y, 100, 20)];
    [btn setTitle:@"登录/注册" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    
    [v addSubview:imageV];
    [v addSubview:label];
    [v addSubview:btn];
    
    //给V添加一个手势 用来注册和登录
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressLogin:)];
//    v.userInteractionEnabled = YES;
//    [v addGestureRecognizer:tap];
    return v;
}
//
//- (void)pressLogin:(UITapGestureRecognizer *)tap
//{
//    NSLog(@"-----");
//    UIView *vw = tap.view;
//    vw.backgroundColor = [UIColor grayColor];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        LoginVC *lrvc = [[LoginVC alloc] init];
        lrvc.title = @"登录微看点";
        [self.navigationController pushViewController:lrvc animated:YES];
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
