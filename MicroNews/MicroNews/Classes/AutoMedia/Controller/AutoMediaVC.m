//
//  AutoMediaVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "AutoMediaVC.h"
#import "CustomView.h"
#import "NetManager.h"
#import "DataModel.h"
#import <UIImageView+WebCache.h>
#import "DetailPageVC.h"

#define HEADER_PIC @"http://www.weixinkd.com/v1/focus/info/get.json?flag=2&uid=13737897&phone_code=9c0e321e1f550df652f08a74525b6c88&channel_code=80000000&device_type=1&phone_network=WIfI&client_version=3.0.3"

@interface AutoMediaVC () <UIScrollViewDelegate>
{
    UIScrollView *_scrollV;
    NSArray *_dataArray;
}


@end

@implementation AutoMediaVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [NSArray array];
    
    [self creatNavView];
    [self createScrollViewInSelfView];
    [self getPic];
}

- (void)getPic
{
    NetManager *nm = [NetManager shareManager];
    [nm requestStrUrl:HEADER_PIC withSuccessBlock:^(id data) {
        NSArray *itemsArray = data[@"items"];
        NSMutableArray *tempArray = [NSMutableArray array];
        for(NSDictionary *dict in itemsArray)
        {
            DataModel *model = [[DataModel alloc] initWithDictionary:dict error:nil];
            [tempArray addObject:model];
        }
        _dataArray = tempArray;
        [self createViewAndHeadViewInScrollView];
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

- (void)creatNavView
{
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 4, SCREEN_WIDTH/3+35, 38)];
    vw.layer.borderWidth = 2;
    vw.layer.cornerRadius = 20;
    vw.layer.masksToBounds = YES;
    UIButton *labelL = [[UIButton alloc] initWithFrame:CGRectMake(vw.frame.origin.x, vw.frame.origin.y-5, vw.width/2, 38)];
    [labelL setTitle:@"自媒体" forState:UIControlStateNormal];
    [labelL setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    labelL.backgroundColor = [UIColor greenColor];
    labelL.layer.cornerRadius = 20;
    labelL.layer.borderWidth = 2;
    labelL.layer.masksToBounds = YES;
    labelL.tag = 1;
    [labelL addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *labelR = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(labelL.frame), vw.y-5, vw.width/2, 38)];
    [labelR setTitle:@"我的订阅" forState:UIControlStateNormal];
    [labelR setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [labelR addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    labelR.tag = 2;
    [vw addSubview:labelL];
    [vw addSubview:labelR];
    self.navigationItem.titleView = vw;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(pressRightAdd)];
    
}

- (void)pressBtn:(UIButton *)btn
{
    if([btn.titleLabel.text isEqualToString:@"我的订阅"])
    {
        btn.backgroundColor = [UIColor greenColor];
        btn.layer.cornerRadius = 20;
        btn.layer.borderWidth = 2;
        btn.layer.masksToBounds = YES;
        
        UIButton *btnL = [self.navigationItem.titleView viewWithTag:btn.tag-1];
        btnL.backgroundColor = [UIColor blackColor];
    }
    if([btn.titleLabel.text isEqualToString:@"自媒体"])
    {
        btn.backgroundColor = [UIColor greenColor];
        btn.layer.cornerRadius = 20;
        btn.layer.borderWidth = 2;
        btn.layer.masksToBounds = YES;
        
        UIButton *btnR = [self.navigationItem.titleView viewWithTag:btn.tag+1];
        btnR.backgroundColor = [UIColor blackColor];
    }
}

- (void)createScrollViewInSelfView
{
    _scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-93)];
    [self.view addSubview:_scrollV];
}

- (void)createViewAndHeadViewInScrollView
{
    //添加头视图
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/3)];
    NSInteger countPic = _dataArray.count;
    
    for(int i=0;i<countPic+2;i++)
    {
        if(i == 0)
        {
            DataModel *model = _dataArray[countPic-1];
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/3)];
            [imageV sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"ditu_bg"]];
            [sv addSubview:imageV];
        }
        else if(i == countPic+1)
        {
            DataModel *model = _dataArray[0];
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_WIDTH/3)];
            [imageV sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"ditu_bg"]];
            [sv addSubview:imageV];
        }
        else
        {
        DataModel *model = _dataArray[i-1];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_WIDTH/3)];
        [imageV sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"ditu_bg"]];
        [sv addSubview:imageV];
        }
    }
    sv.pagingEnabled = YES;
    sv.contentSize = CGSizeMake((countPic+2)*SCREEN_WIDTH, SCREEN_WIDTH/3);
    sv.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    sv.showsHorizontalScrollIndicator = NO;
    sv.delegate = self;
    [_scrollV addSubview:sv];
    
    UIPageControl *pc = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sv.frame)-20, SCREEN_WIDTH, 20)];
    pc.numberOfPages = countPic;
    pc.currentPageIndicatorTintColor = [UIColor greenColor];
    pc.pageIndicatorTintColor = [UIColor grayColor];
    pc.tag = 10;
    [_scrollV addSubview:pc];
    
    //添加内容视图
    NSArray *titleA = @[@"笑话",@"美文",@"健康",@"娱乐",@"社会",@"科技",@"体育",
                        @"生活",@"财经",@"汽车",@"探索",@"美食",@"职场",@"时尚",
                        @"旅游",@"育儿",@"教育",@"情感",@"星座",@"宠物"];
    NSInteger count = titleA.count;
    NSInteger viewWidth = SCREEN_WIDTH/3;
    for(int i=0;i<count;i++)
    {
        CustomView *cvw = [[CustomView alloc] initWithFrame:CGRectMake((i%3)*viewWidth, (i/3)*(viewWidth)+SCREEN_WIDTH/3, viewWidth, viewWidth-10)];
        cvw.titleL.text = titleA[i];
        cvw.imageV.image = [UIImage imageNamed:titleA[i]];
        cvw.tag = 20+i;
        [_scrollV addSubview:cvw];
        if(i == count-1)
        {
            _scrollV.contentSize = CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(cvw.frame)+10);
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap addTarget:self action:@selector(pressTap:)];
        [cvw addGestureRecognizer:tap];
    }
}

- (void)pressTap:(UITapGestureRecognizer *)tap
{
    DetailPageVC *dpvc = [[DetailPageVC alloc] init];
    UIView *tuv = tap.view;
    switch (tuv.tag) {
        case 20:
            [self.navigationController pushViewController:dpvc animated:YES];
            break;
        case 21:
            NSLog(@"addffdfdfds");
        default:
            break;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x == 0)
    {
        scrollView.contentOffset = CGPointMake(4*SCREEN_WIDTH, 0);
    }
    if(scrollView.contentOffset.x == 5*SCREEN_WIDTH)
    {
        scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    }
    UIPageControl *pc = [_scrollV viewWithTag:10];
    pc.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH-1;
}

- (void)pressRightAdd
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
