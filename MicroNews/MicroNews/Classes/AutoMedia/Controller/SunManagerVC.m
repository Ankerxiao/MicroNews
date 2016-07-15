//
//  SunManagerVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/14.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "SunManagerVC.h"
#import "AppSub.h"
#import "NetManager.h"
#import "DetailPageVC.h"

@interface SunManagerVC () <UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isFirst;
    UIButton *_gBtn;
    NSMutableArray *_dataArray;
}
@property (nonatomic,strong) UITableView *tableV;
@end

@implementation SunManagerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化各个成员变量
    _isFirst = YES;
    _dataArray = [NSMutableArray array];
    
    //左侧ScrollView
    [self createScrollView];
    
    //右侧tableView
    [self createTableView];
    
    //请求数据
    [self getDataFromServer:HEADER_PIC];
}

#pragma mark 请求数据
- (void)getDataFromServer:(NSString *)urlStr
{
    NetManager *nm = [NetManager shareManager];
    [nm requestStrUrl:urlStr withSuccessBlock:^(id data) {
        NSArray *itemsArray = data[@"items"];
        NSMutableArray *tempArray = [NSMutableArray array];
        for(NSDictionary *dict in itemsArray)
        {
            DataModel *model = [[DataModel alloc] initWithDictionary:dict error:nil];
            [tempArray addObject:model];
        }
        _dataArray = tempArray;
        dispatch_async(dispatch_get_main_queue(),^{
            [_tableV reloadData];
        });
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

#pragma mark 创建ScrollView
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
        btn.tag = 1+i;
        if(i == 1)
        {
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
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
    NSLog(@"%lud",button.tag);
    switch (button.tag)
    {
        case 1: //我的
            [_dataArray removeAllObjects];
            //数据库查找
            [_tableV reloadData];
            break;
        case 2://推荐 默认显示的页面
            [_dataArray removeAllObjects];
            [_tableV reloadData];
            break;
        case 3:
            [_dataArray removeAllObjects];
            [self getDataFromServer:XIAO_API];
            break;
        case 4:
            [_dataArray removeAllObjects];
            [self getDataFromServer:MEI_API];
            break;
        case 5:
            [_dataArray removeAllObjects];
            [self getDataFromServer:JIAN_API];
            break;
        case 6:
            [_dataArray removeAllObjects];
            [self getDataFromServer:YU_API];
            break;
        case 7:
            [_dataArray removeAllObjects];
            [self getDataFromServer:SHE_API];
            break;
        case 8:
            [_dataArray removeAllObjects];
            [self getDataFromServer:KE_API];
            break;
        case 9:
            [_dataArray removeAllObjects];
            [self getDataFromServer:TI_API];
            break;
        case 10:
            [_dataArray removeAllObjects];
            [self getDataFromServer:SHENG_API];
            break;
        case 11:
            [_dataArray removeAllObjects];
            [self getDataFromServer:CAI_API];
            break;
        case 12:
            [_dataArray removeAllObjects];
            [self getDataFromServer:QI_API];
            break;
        case 13:
            [_dataArray removeAllObjects];
            [self getDataFromServer:TAN_API];
            break;
        case 14:
            [_dataArray removeAllObjects];
            [self getDataFromServer:MEIS_API];
            break;
        case 15:
            [_dataArray removeAllObjects];
            [self getDataFromServer:ZHI_API];
            break;
        case 16:
            [_dataArray removeAllObjects];
            [self getDataFromServer:SHI_API];
            break;
        case 17:
            [_dataArray removeAllObjects];
            [self getDataFromServer:LV_API];
            break;
        case 18:
            [_dataArray removeAllObjects];
            [self getDataFromServer:YUL_API];
            break;
        case 19:
            [_dataArray removeAllObjects];
            [self getDataFromServer:JIAO_API];
            break;
        case 20:
            [_dataArray removeAllObjects];
            [self getDataFromServer:QING_API];
            break;
        case 21:
            [_dataArray removeAllObjects];
            [self getDataFromServer:XIN_API];
            break;
        case 22:
            [_dataArray removeAllObjects];
            [self getDataFromServer:CHONG_API];
            break;
        default:
            break;
    }
//    [self.navigationController pushViewController:dpvc animated:YES];
    
}

#pragma mark 创建右侧的tableView
- (void)createTableView
{
    _tableV = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/5, 0, 4*SCREEN_WIDTH/5, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    [self.view addSubview:_tableV];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cellID";
    AppSub *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AppSub" owner:nil options:nil] lastObject];
    }
    cell.model = _dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
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
