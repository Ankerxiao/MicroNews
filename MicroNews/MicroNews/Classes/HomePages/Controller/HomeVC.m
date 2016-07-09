//
//  HomeVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "HomeVC.h"
#import "NavBtnListScrollView.h"
#import "DataModel.h"
#import "ScrollTableView.h"
#import "NetManager.h"
#import "DetailVC.h"

@interface HomeVC () <NavBtnListScrollViewDelegate,ScrollTableViewDelegate>

@property (nonatomic,strong) NSMutableArray *totalNewsArray;
@property (nonatomic,strong) ScrollTableView *scrollTableView;
@property (nonatomic,strong) NavBtnListScrollView *navBtnScroll;
@property (nonatomic,strong) NSArray *originalArray;
//@property (nonatomic,strong) NSMutableArray *testArray;

@end

@implementation HomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    [self initNavView];
    [self initSubViews];
    [self loadDataWithIndex:0];
}

- (void)initData
{
    _originalArray = @[@{TUIJIAN_API:@"推荐"},@{XIAOHUA_API:@"笑话"},
                       @{MEIWEN_API:@"美食"},@{JIANKANG_API:@"健康"},
                       @{YULE_API:@"娱乐"},@{SHEHUI_API:@"社会"},
                       @{KEJI_API:@"科技"},@{TIYU_API:@"体育"},
                       @{CAIJIN_API:@"财经"},@{QICHE_API:@"汽车"},
                       @{TANSUO_API:@"探索"},@{MEISHI_API:@"美食"},
                       @{ZHICHANG_API:@"职场"},@{SHISHANG_API:@"时尚"},
                       @{LVYOU_API:@"旅游"},@{YUER_API:@"育儿"},
                       @{JIAOYU_API:@"教育"}];
    _totalNewsArray = [[NSMutableArray alloc] init];
    NSInteger count = [_originalArray count];
    while(count--)
    {
        [_totalNewsArray addObject:[[NSMutableArray alloc] init]];
    }
}

- (void)initNavView
{
//    NavBtnListScrollView *btnSV = [[NavBtnListScrollView alloc] initWithBtnTitleArray:@[@"推荐",@"笑话",@"美文",@"健康",@"娱乐",@"社会",@"科技",@"体育",@"财经",@"汽车",@"探索",@"美食",@"职场",@"时尚",@"旅游",@"育儿",@"教育"]];
//    NavBtnListScrollView *btnSV = [[NavBtnListScrollView alloc] init];
    NSMutableArray *btnTitle = [NSMutableArray array];
    for(NSDictionary *dict in _originalArray)
    {
        [btnTitle addObject:[dict valueForKey:[[dict allKeys] firstObject]]];
    }
    _navBtnScroll = [[NavBtnListScrollView alloc] initWithBtnTitleArray:btnTitle];
    _navBtnScroll.delegate = self;
    self.navigationItem.titleView = _navBtnScroll;
}

- (void)initSubViews
{
    _scrollTableView = [[ScrollTableView alloc] initWithTableView:[_originalArray count] andDelegate:self];
    [self.view addSubview:_scrollTableView];
}

- (void)loadDataWithIndex:(NSInteger)index
{
    NSString *urlStr = [[_originalArray[index] allKeys] firstObject];
    [[NetManager shareManager] requestStrUrl:urlStr withSuccessBlock:^(id data) {
        NSMutableArray *arrayTemp = [NSMutableArray array];
        for(NSDictionary *dict in data[@"items"])
        {
            DataModel *model = [[DataModel alloc] initWithDictionary:dict error:nil];
            [arrayTemp addObject:model];
        }
        if(index == 0)
        {
            _scrollTableView.dataArray = arrayTemp;
        }
        [_totalNewsArray replaceObjectAtIndex:index withObject:arrayTemp];
        [_scrollTableView refreshTableViewWithSection:index];
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark ScrollTableView代理
- (void)didSelectdTableViewCellWithSection:(NSInteger)section andRow:(NSInteger)row
{
    DataModel *model = _totalNewsArray[section][row];
    NSLog(@"%@",model.wurl);
    DetailVC *dvc = [[DetailVC alloc] initWithUrlString:model.wurl];
    dvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dvc animated:YES];
}

- (NSInteger)tableViewNumOfScrollSection:(NSInteger)section
{
    return [_totalNewsArray[section] count];
}

- (DataModel *)dataModelWithTableViewSection:(NSInteger)section andCellRow:(NSInteger)row
{
    return _totalNewsArray[section][row];
}

- (NSArray *)getNibArrayWithTableSection:(NSInteger)section
{
    UINib *nib1 = [UINib nibWithNibName:@"HomeCellOne" bundle:nil];
    UINib *nib2 = [UINib nibWithNibName:@"HomeCell" bundle:nil];
    return @[nib1,nib2];
}

- (UINib *)getNibWithTableSection:(NSInteger)section
{
    return [UINib nibWithNibName:@"HomeCell" bundle:nil];
}

- (void)loadTableViewDataWithSection:(NSInteger)section
{
    [self loadDataWithIndex:section];
}

- (void)currentPageNum:(NSInteger)section
{
    [_navBtnScroll scrollBtnListWithIndex:section];
}

#pragma mark NavBtnListScrollView的代理方法
- (void)didSelectedBtnWithIndex:(NSInteger)index
{
    [_scrollTableView scrollTableViewListWithSection:index];
}

- (CGFloat)tableViewCellHeightWithSection:(NSInteger)section andRow:(NSInteger)row
{
    DataModel *model = _totalNewsArray[section][row];
    if(model.extra.count == 0)
    {
        return 100;
    }
    if(model.extra.count != 0)
    {
        return 150;
    }
    return 0;
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
