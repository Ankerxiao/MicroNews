//
//  AutoMediaVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#define HEADER_PIC @"http://www.weixinkd.com/v1/focus/info/get.json?flag=2&uid=13737897&phone_code=9c0e321e1f550df652f08a74525b6c88&channel_code=80000000&device_type=1&phone_network=WIfI&client_version=3.0.3"

#define XIAO_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=5&device_platform=iphone&sign=01ffb4229ac04909f3eb9eda20f3adab&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=2C13BD59-23FC-47CA-9BC5-D81F5F69A6AB"

#define MEI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=2&device_platform=iphone&sign=387ac0b70437236401aecce4ca8944b6&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=CE2DA561-8956-4B76-B2F6-FC6112B965C4"

#define JIAN_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=3&device_platform=iphone&sign=523b9a2a87494196bb1558fdfe327bbf&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=84763603-3796-4807-A09C-8B0D1FDEC756"

#define YU_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=19&device_platform=iphone&sign=9302c896fb3243db54924094bddf26a3&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=275AA970-2780-4CD7-9490-5604E117E674"

#define SHE_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=25&device_platform=iphone&sign=a42a16d55874ae9456df4b8d7547d8a0&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=35DFD1D2-ACD8-4F0F-AB6C-E0E6DD01938C"

#define KE_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=10&device_platform=iphone&sign=041b5ea75a45424131b10b3f8634440f&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=32EC4776-5C7D-4023-ACFC-81B5971CEB5E"

#define TI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=1307&device_platform=iphone&sign=f2f3f8741bec04e7d804b117154ac7f4&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=77E6BB1F-53AE-4590-9C3E-03EAC27EC320"

#define SHENG_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=21&device_platform=iphone&sign=adb1f43839f88a03a550d2045c98636d&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=B6DD14D6-3DB5-4E33-A94F-53F7FBCDB5D3"

#define CAI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=11&device_platform=iphone&sign=9992e04add201486c52bd15a840b33a2&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=066E6053-5A8F-4D31-AC7C-44AC03BF84CD"

#define QI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=13&device_platform=iphone&sign=75c3e923fbfb53813a32dc5100792760&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=F6F911A5-B9B0-40FD-B20C-152438D0A33E"

#define TAN_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=23&device_platform=iphone&sign=f59cdc408371441fd77659f73714e9ec&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=AF0CF083-769D-46D5-8254-5B31DAA52DB9"

#define MEIS_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=4&device_platform=iphone&sign=3c78a60a9f39e5c69225d1f579dcb98d&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=2B9EC02D-D99C-4CF4-8D35-027299D83924"

#define ZHI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=6&device_platform=iphone&sign=91145a1e37d5890b285932f1783c0fcd&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=BB09262A-71E2-413F-9A51-0F6894BD8578"

#define SHI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=17&device_platform=iphone&sign=4a8906d070089c0d596d519f731d957e&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=931C4234-97AE-4FFB-BD52-2C4415711E76"

#define LV_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=7&device_platform=iphone&sign=457025904f96811b92007b12b70330f7&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=D72372CD-9B9F-4267-80FC-9667BA09668E"

#define YUL_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=8&device_platform=iphone&sign=1357f6f93927e8bc865bf6470357f974&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=B26EBC52-E120-4983-81A9-8BBAA8F44C17"

#define JIAO_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=9&device_platform=iphone&sign=0870fbab4728a87e503e891798b61163&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=F2C5DEB8-F286-4465-9103-B210CE4F14E0"

#define QING_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=18&device_platform=iphone&sign=0f880806ddf2432f05c902011986b20e&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=C15DFF74-70A8-47B4-9912-54BAC839B83B"

#define XIN_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=16&device_platform=iphone&sign=4f0cf31bc56f2cb29b5a04c45a1b40d3&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=0087256F-72E5-4C9F-BAFC-CDE9D14E566A"

#define CHONG_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=24&device_platform=iphone&sign=638ecf9375682158a2a73aec06ea1454&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=C284D116-9CC0-4633-8574-0FB894A1D702"

#import "AutoMediaVC.h"
#import "CustomView.h"
#import "NetManager.h"
#import "DataModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DetailPageVC.h"
#import "MySub.h"
#import "DatabaseManager.h"
#import "SunManagerVC.h"

@interface AutoMediaVC () <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView *_scrollV;
    NSArray *_dataArray;
    UITableView *_tableV;
}


@end

@implementation AutoMediaVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [NSArray array];
    _tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    _tableV.alpha = 0;
    [self.view addSubview:_tableV];
    [self creatNavView];
    [self createScrollViewInSelfView];
//    [self createMySubViewInView];
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
        _scrollV.alpha = 0;
        
        //需要判断数据库中是否有收藏的媒体号，以区分是否显示tableView的headerView
        DatabaseManager *dbm = [DatabaseManager sharedDatabaseManager];
        if([dbm tableIsNull])
        {
            _tableV.tableHeaderView = [self createHeaderView];
        }
        else
        {
            
        }
        _tableV.alpha = 1;
    }
    if([btn.titleLabel.text isEqualToString:@"自媒体"])
    {
        btn.backgroundColor = [UIColor greenColor];
        btn.layer.cornerRadius = 20;
        btn.layer.borderWidth = 2;
        btn.layer.masksToBounds = YES;
        UIButton *btnR = [self.navigationItem.titleView viewWithTag:btn.tag+1];
        btnR.backgroundColor = [UIColor blackColor];
        _scrollV.alpha = 1;
        _tableV.alpha = 0;
    }
}

#pragma mark 自媒体页面ScrollView
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
            imageV.image = [UIImage imageNamed:@"ditu_bg"];
            NSLog(@"%@",model.pic);
//            [imageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
            [imageV sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"ditu_bg"]];
//            [imageV setImageWithURL:[NSURL URLWithString:model.pic]];
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
    switch (tuv.tag)
    {
        case 20:
            dpvc.urlStr = XIAO_API;
            dpvc.title = @"笑话";
            break;
        case 21:
            dpvc.urlStr = MEI_API;
            dpvc.title = @"美文";
            break;
        case 22:
            dpvc.urlStr = JIAN_API;
            dpvc.title = @"健康";
            break;
        case 23:
            dpvc.urlStr = YU_API;
            dpvc.title = @"娱乐";
            break;
        case 24:
            dpvc.urlStr = SHE_API;
            dpvc.title = @"社会";
            break;
        case 25:
            dpvc.urlStr = KE_API;
            dpvc.title = @"科技";
            break;
        case 26:
            dpvc.urlStr = TI_API;
            dpvc.title = @"体育";
            break;
        case 27:
            dpvc.urlStr = SHENG_API;
            dpvc.title = @"生活";
            break;
        case 28:
            dpvc.urlStr = CAI_API;
            dpvc.title = @"财经";
            break;
        case 29:
            dpvc.urlStr = QI_API;
            dpvc.title = @"汽车";
            break;
        case 30:
            dpvc.urlStr = TAN_API;
            dpvc.title = @"探索";
            break;
        case 31:
            dpvc.urlStr = MEIS_API;
            dpvc.title = @"美食";
            break;
        case 32:
            dpvc.urlStr = ZHI_API;
            dpvc.title = @"职场";
            break;
        case 33:
            dpvc.urlStr = SHI_API;
            dpvc.title = @"时尚";
            break;
        case 34:
            dpvc.urlStr = LV_API;
            dpvc.title = @"旅游";
            break;
        case 35:
            dpvc.urlStr = YUL_API;
            dpvc.title = @"育儿";
            break;
        case 36:
            dpvc.urlStr = JIAO_API;
            dpvc.title = @"教育";
            break;
        case 37:
            dpvc.urlStr = QING_API;
            dpvc.title = @"情感";
            break;
        case 38:
            dpvc.urlStr = XIN_API;
            dpvc.title = @"星座";
            break;
        case 39:
            dpvc.urlStr = CHONG_API;
            dpvc.title = @"宠物";
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:dpvc animated:YES];
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

#pragma mark 我的订阅页面TableView
- (void)createMySubViewInView
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 120, 40, 20)];
    [btn setTitle:@"添加订阅" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [_tableV addSubview:btn];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (UIView *)createHeaderView
{
    UIView *vw = [[UIView alloc] initWithFrame:self.view.bounds];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text_icon"]];;
    imageV.frame = CGRectMake(145, 80, 73, 73);
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(130, CGRectGetMaxY(imageV.frame)+10, SCREEN_WIDTH/2, 20);
    label.text = @"新文章随时提醒";
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(100, CGRectGetMaxY(label.frame)+5, SCREEN_WIDTH/2, 20);
    label2.text = @"从这些自媒体号开始吧";
    [vw addSubview:imageV];
    [vw addSubview:label];
    [vw addSubview:label2];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(125, CGRectGetMaxY(label2.frame)+30, 100, 30)];
    UIImageView *imageVAdd = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 18, 18)];
    imageVAdd.image = [UIImage imageNamed:@"interest_add_icon"];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageVAdd.frame)+5, imageVAdd.frame.origin.y, 70, 20)];
    label3.text = @"添加订阅";
    label3.textColor = [UIColor greenColor];
    [btn addSubview:imageVAdd];
    [btn addSubview:label3];
    btn.layer.borderWidth = 2;
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    [btn addTarget:self action:@selector(pressSub) forControlEvents:UIControlEventTouchUpInside];
    [vw addSubview:btn];
    return vw;
}

- (void)pressSub
{
    SunManagerVC *smvc = [[SunManagerVC alloc] init];
    smvc.title = @"订阅管理";
    
    [self.navigationController pushViewController:smvc animated:YES];
}

- (void)pressRightAdd
{
    [self pressSub];
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
