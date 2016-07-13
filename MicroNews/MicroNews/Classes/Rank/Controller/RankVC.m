//
//  RankVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "RankVC.h"
#import "DataModel.h"
#import "HomeCell.h"
#import "HomeCellOne.h"
#import "NetManager.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/SSEShareHelper.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>
#import <ShareSDKUI/SSUIShareActionSheetCustomItem.h>
#import <ShareSDK/ShareSDK+Base.h>

#import <ShareSDKExtension/ShareSDK+Extension.h>

@interface RankVC () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArray;
    BOOL _isFirst;
    UIView *_suspensionV;
    NSInteger _index;
}
@property (nonatomic,strong) UITableView *tableV;
@end

static NSString *str = @"cellID";

@implementation RankVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [NSMutableArray array];
    _suspensionV = [[UIView alloc] init];
    _suspensionV = [self createSuspensionView];
    _suspensionV.frame = CGRectMake(0, -240, SCREEN_WIDTH, 240);
    
    
    [self.view addSubview:[self fourBtn]];
    [self.tableV addSubview:_suspensionV];
    [self.view addSubview:self.tableV];
    
    
    //默认请求“蹿红”
    [self getDataFromServer:CUANHONG_API];
}

#pragma mark 四个按钮
- (UIView *)fourBtn
{
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    vw.backgroundColor = [UIColor grayColor];
    
    NSArray *title = @[@"全部",@"蹿红",@"七天",@"总榜"];
    for(int i=0;i<4;i++)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, 40)];
        [btn setTitle:title[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if(i == 1)
        {
            [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        }
        btn.tag = 1+i;
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [vw addSubview:btn];
    }
    return vw;
}

- (void)pressBtn:(UIButton *)btn
{
    static NSUInteger i=2;
    if([btn.titleLabel.text isEqualToString:@"蹿红"])
    {
        //更改按钮颜色
        UIButton *lastBtn = [self.view viewWithTag:i];
        [lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        i = btn.tag;
        [_dataArray removeAllObjects];
        [self getDataFromServer:CUANHONG_API];
    }
    else if([btn.titleLabel.text isEqualToString:@"七天"])
    {
        UIButton *lastBtn = [self.view viewWithTag:i];
        [lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        i = btn.tag;
        [_dataArray removeAllObjects];
        [self getDataFromServer:QITIAN_API];
    }
    else if([btn.titleLabel.text isEqualToString:@"总榜"])
    {
        UIButton *lastBtn = [self.view viewWithTag:i];
        [lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        i = btn.tag;
        [_dataArray removeAllObjects];
        [self getDataFromServer:ZONGBANG_API];
    }
    else if([btn.titleLabel.text isEqualToString:@"全部"])
    {
        [btn setTitle:@"收起" forState:UIControlStateNormal];
        NSLog(@"----------");
        
        //展开(添加)一个View，并隐藏另外三个btn
        [UIView animateWithDuration:0.5 animations:^{
            _suspensionV.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
        }];
    }
    else
    {
        NSLog(@"收起");
        [btn setTitle:@"全部" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            _suspensionV.frame = CGRectMake(0, -200, SCREEN_WIDTH, 200);
        }];
        
    }
}

- (UIView *)createSuspensionView
{
    NSArray *categoryTitle = @[@{TUIJIAN_API:@"全部"},@{XIAOHUA_API:@"笑话"},
                             @{MEIWEN_API:@"美文"},@{JIANKANG_API:@"健康"},
                             @{YULE_API:@"娱乐"},@{SHEHUI_API:@"社会"},
                             @{KEJI_API:@"科技"},@{TIYU_API:@"体育"},
                             @{CAIJIN_API:@"财经"},@{QICHE_API:@"汽车"},
                             @{TANSUO_API:@"探索"},@{MEISHI_API:@"美食"},
                             @{ZHICHANG_API:@"职场"},@{SHISHANG_API:@"时尚"},
                             @{LVYOU_API:@"旅游"},@{YUER_API:@"育儿"},
                             @{JIAOYU_API:@"教育"}];
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
    NSInteger count = categoryTitle.count;
    for(int i=0;i<count;i++)
    {
        int line = i%5;
        int row = i/5;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5+line*SCREEN_WIDTH/5, 10+row*SCREEN_WIDTH/7, 60, 20)];
        [btn setTitle:[[categoryTitle[i] allValues] lastObject]  forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [vw addSubview:btn];
    }
    vw.backgroundColor = [UIColor redColor];
    return vw;
}

- (void)btnPress:(UIButton *)btn
{
    UIButton *prebtn = [self.view viewWithTag:1];
    [prebtn setTitle:btn.titleLabel.text forState:UIControlStateNormal];
    [UIView animateWithDuration:0.5 animations:^{
        _suspensionV.frame = CGRectMake(0, -240, SCREEN_WIDTH, 240);
    }];
}

#pragma mark 请求数据
- (void)getDataFromServer:(NSString *)str
{
    NetManager *nm = [NetManager shareManager];
    [nm requestStrUrl:str withSuccessBlock:^(id data) {
        NSArray *array = data[@"items"];
        NSMutableArray *temp = [NSMutableArray array];
        for(NSDictionary *dict in array)
        {
            DataModel *model = [[DataModel alloc] initWithDictionary:dict error:nil];
            [temp addObject:model];
        }
        _dataArray = temp;
        dispatch_async(dispatch_get_main_queue(),^{
            [self.tableV reloadData];
        });
        
    } withFailedBlock:^(NSError *error) {
        
    }];
}

#pragma mark tableView的初始化
- (UITableView *)tableV
{
    if(nil == _tableV)
    {
        _tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-113) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        
        NSArray* nibArray = [self getNibArrayWithTableSection];
        for (int index = 0; index < [nibArray count]; index++)
        {
            [self.tableV registerNib:nibArray[index] forCellReuseIdentifier:[NSString stringWithFormat:@"%@_%d",str,index]];
        }
    }
    return _tableV;
}

#pragma mark 方便以后扩展，可能一个tableView里会有两种类型的cell
- (NSArray *)getNibArrayWithTableSection
{
    UINib *nib1 = [UINib nibWithNibName:@"HomeCellOne" bundle:nil];
    UINib *nib2 = [UINib nibWithNibName:@"HomeCell" bundle:nil];
    return @[nib1,nib2];
}

#pragma mark 组视图和其高度
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return [self fourBtn];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40;
//}

#pragma mark 每组有多少个cell(就一组)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

#pragma mark 每个cell的数据及cell的高度
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataModel *model = [[DataModel alloc] init];
    model = _dataArray[indexPath.row];
    if(model.extra.count != 0)
    {
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@_%d",str,1]];
        [cell updateCellData:model];
        cell.shareImage.image = [UIImage imageNamed:@"pyq_icon"];
        cell.shareImage.userInteractionEnabled = YES;
        _index = indexPath.row;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        
        [cell.shareImage addGestureRecognizer:tap];
        return cell;
    }
    if(model.extra.count == 0)
    {
        HomeCellOne *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@_%d",str,0]];
        [cell updateCellData:model];
        return cell;
    }
    return nil;
}

- (void)pressTap:(UITapGestureRecognizer *)tap
{
    DataModel *model = [[DataModel alloc] init];
    model = _dataArray[_index];
    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:model.title images:nil url:[NSURL URLWithString:model.wurl] title:@"分享给你哈" type:SSDKContentTypeText];
    [ShareSDK share:SSDKPlatformSubTypeWechatTimeline parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        switch(state)
        {
            case SSDKResponseStateSuccess:
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                    message:nil
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil];
                [alertView show];
            }
                break;
            case SSDKResponseStateFail:
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                    message:[NSString stringWithFormat:@"%@", error]
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil];
                [alertView show];
            }
                break;
            default:
                break;
        }
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell被选中");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
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
