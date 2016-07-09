//
//  ScrollTableView.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "ScrollTableView.h"
#import "HomeCell.h"
#import "HomeCellOne.h"

#define TABLEVIEW_TAG_BEGIN (100)
#define CELL_HEIGHT (100)
#define CELL_IDENTIFIER_ONE @"cellOne"
#define CELL_IDENTIFIER_THREE @"cellThree"

@interface ScrollTableView () <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating>
{
    NSMutableArray *_searchArray;
    
}
@property (nonatomic,strong) UIScrollView *scrollV;
@property (nonatomic,assign) NSInteger tableViewCount;
@property (nonatomic,assign) NSInteger currentPageNum;

@end

@implementation ScrollTableView

- (instancetype)initWithTableView:(NSInteger)count andDelegate:(id<ScrollTableViewDelegate>)delegate
{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_STATUS_HEIGHT - TABBAR_HEIGHT)])
    {
        _tableViewCount = count;
        self.delegate = delegate;
        _searchArray = [NSMutableArray array];
        _dataArray = [NSMutableArray array];
        [self initTableView];
    }
    return self;
}

- (instancetype)initWithTableView:(NSInteger)index
{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_STATUS_HEIGHT - TABBAR_HEIGHT)])
    {
        _tableViewCount = index;
        [self initTableView];
    }
    return self;
}

- (void)initTableView
{
    _scrollV = [[UIScrollView alloc] initWithFrame:self.bounds];
    [_scrollV setContentSize:CGSizeMake(_tableViewCount*SCREEN_WIDTH, 0)];
    _scrollV.delegate = self;
    _scrollV.pagingEnabled = YES;
    
    for(int i=0;i<_tableViewCount;i++)
    {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, _scrollV.height)];
        tableView.tag = TABLEVIEW_TAG_BEGIN + i;
        tableView.delegate = self;
        tableView.dataSource = self;
//        tableView.tableHeaderView = [self tableHeaderView];
        if([self checkDelSelect:@selector(getNibWithTableSection:)])
        {
            NSArray* nibArray = [_delegate getNibArrayWithTableSection:i];
            for (int index = 0; index < [nibArray count]; index++)
            {
                [tableView registerNib:nibArray[index] forCellReuseIdentifier:[NSString stringWithFormat:@"%@_%d",CELL_IDENTIFIER_THREE,index]];
            }
        }
        else
        {
            assert("error");
        }
        [_scrollV addSubview:tableView];
    }
    [self addSubview:_scrollV];
}

- (BOOL)checkDelSelect:(SEL)select
{
    return (_delegate != nil && [_delegate respondsToSelector:select]);
}

- (void)refreshTableViewWithSection:(NSInteger)index
{
    UITableView *tableV = [_scrollV viewWithTag:index+TABLEVIEW_TAG_BEGIN];
    [tableV performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:nil];
//    [tableV performSelector:@selector(reloadData) withObject:nil afterDelay:NO];
}

#pragma mark TableView的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self checkDelSelect:@selector(didSelectdTableViewCellWithSection:andRow:)])
    {
        [_delegate didSelectdTableViewCellWithSection:tableView.tag-TABLEVIEW_TAG_BEGIN andRow:indexPath.row];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self checkDelSelect:@selector(tableViewCellHeightWithSection:andRow:)])
    {
        return [_delegate tableViewCellHeightWithSection:tableView.tag-TABLEVIEW_TAG_BEGIN andRow:indexPath.row];
    }
    return CELL_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_searchC.active && section == 0)
    {
        return _searchArray.count;
    }
    else if([self checkDelSelect:@selector(tableViewNumOfScrollSection:)])
    {
        return [_delegate tableViewNumOfScrollSection:tableView.tag-TABLEVIEW_TAG_BEGIN];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self checkDelSelect:@selector(dataModelWithTableViewSection:andCellRow:)])
    {
        DataModel *model = [self.delegate dataModelWithTableViewSection:tableView.tag-TABLEVIEW_TAG_BEGIN andCellRow:indexPath.row];
//        [_dataArray addObject:model];
        if(model.extra.count != 0)
        {
            HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@_%d",CELL_IDENTIFIER_THREE,1]];
            if(_searchC.active && indexPath.section == 0)
            {
                DataModel *mo = _searchArray[indexPath.row];
                [cell updateCellData:mo];
            }
            else
            {
                [cell updateCellData:model];
            }
            return cell;
        }
        if(model.extra.count == 0)
        {
            HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@_%d",CELL_IDENTIFIER_THREE,0]];
            if(_searchC.active && indexPath.section == 0)
            {
                DataModel *mo = _searchArray[indexPath.row];
                [cell updateCellData:mo];
            }
            else
            {
                [cell updateCellData:model];
            }
//            [cell updateCellData:model];
            return cell;
        }
    }
    return nil;
}

- (void)scrollTableViewListWithSection:(NSInteger)section
{
    [_scrollV setContentOffset:CGPointMake(section*SCREEN_WIDTH, 0) animated:YES];
}

#pragma mark ScrollView的代理方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollDeal:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollDeal:scrollView];
}

- (void)scrollDeal:(UIScrollView *)scrollView
{
    if([scrollView isMemberOfClass:[UIScrollView class]])
    {
        NSInteger pageNum = scrollView.contentOffset.x/SCREEN_WIDTH;
        if(pageNum != _currentPageNum)
        {
            _currentPageNum = pageNum;
            if([self checkDelSelect:@selector(currentPageNum:)])
            {
                [_delegate currentPageNum:_currentPageNum];
            }
        }
        if([self checkDelSelect:@selector(loadTableViewDataWithSection:)])
        {
            [_delegate loadTableViewDataWithSection:pageNum];
        }
    }
}

- (UIView *)tableHeaderView
{
    _searchC = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchC.delegate = self;
    _searchC.searchResultsUpdater = self;
    ////        _searchC.hidesNavigationBarDuringPresentation = YES;
    //        _searchC.dimsBackgroundDuringPresentation = NO;
    _searchC.obscuresBackgroundDuringPresentation = NO;
    _searchC.searchBar.frame = CGRectMake(0, 0, self.frame.size.width-60, 44);
    _searchC.searchBar.placeholder = @"搜索";
    
    return _searchC.searchBar;
}

//searchBar的代理
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchStr = [_searchC.searchBar text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@",searchStr];
    if(_searchArray != nil)
    {
        [_searchArray removeAllObjects];
    }
    
    //过滤数据
    _searchArray = [NSMutableArray arrayWithArray:[_dataArray filteredArrayUsingPredicate:predicate]];
    [self refreshTableViewWithSection:0];
}

@end
