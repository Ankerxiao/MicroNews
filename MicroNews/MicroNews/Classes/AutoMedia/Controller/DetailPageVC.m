//
//  DetailPageVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/9.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "DetailPageVC.h"
#import "AppSub.h"
#import "NetManager.h"

#define XIAO_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=5&device_platform=iphone&sign=01ffb4229ac04909f3eb9eda20f3adab&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=2C13BD59-23FC-47CA-9BC5-D81F5F69A6AB"

@interface DetailPageVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableV;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation DetailPageVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor grayColor];
    [self getPic];
}

- (void)getPic
{
    NetManager *nm = [NetManager shareManager];
    [nm requestStrUrl:XIAO_API withSuccessBlock:^(id data) {
        NSArray *itemsArray = data[@"items"];
        NSMutableArray *tempArray = [NSMutableArray array];
        for(NSDictionary *dict in itemsArray)
        {
            DataModel *model = [[DataModel alloc] initWithDictionary:dict error:nil];
            [tempArray addObject:model];
        }
        self.dataArray = tempArray;
        [self.view addSubview:self.tableV];
    } withFailedBlock:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

- (UITableView *)tableV
{
    if(nil == _tableV)
    {
        _tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-93) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
    }
    return _tableV;
}

- (NSMutableArray *)dataArray
{
    if(nil == _dataArray)
    {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cellID";
    AppSub *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AppSub" owner:nil options:nil] lastObject];
    }
    
    cell.model = self.dataArray[indexPath.row];
    return cell;
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
