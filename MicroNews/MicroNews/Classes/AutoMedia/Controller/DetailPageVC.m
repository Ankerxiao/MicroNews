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
#import "SearchVC.h"

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"channel_search_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(searchMicroNum)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    [self getPic];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchMicroNum
{
    SearchVC *svc = [[SearchVC alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)getPic
{
    NetManager *nm = [NetManager shareManager];
    [nm requestStrUrl:self.urlStr withSuccessBlock:^(id data) {
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
