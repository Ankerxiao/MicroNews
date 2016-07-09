//
//  ScrollTableView.h
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@protocol ScrollTableViewDelegate <NSObject>

- (NSInteger)tableViewNumOfScrollSection:(NSInteger)section;
- (void)loadTableViewDataWithSection:(NSInteger)section;
- (void)currentPageNum:(NSInteger)section;
- (void)didSelectdTableViewCellWithSection:(NSInteger)section andRow:(NSInteger)row;
- (DataModel *)dataModelWithTableViewSection:(NSInteger)section andCellRow:(NSInteger)row;
- (UINib *)getNibWithTableSection:(NSInteger)section;
- (NSArray *)getNibArrayWithTableSection:(NSInteger)section;

@optional
- (CGFloat)tableViewCellHeightWithSection:(NSInteger)section andRow:(NSInteger)row;

@end

@interface ScrollTableView : UIView

@property (nonatomic,weak) id <ScrollTableViewDelegate> delegate;
@property (nonatomic,strong) UISearchController *searchC;
@property (nonatomic,strong) NSMutableArray *dataArray;

- (instancetype)initWithTableView:(NSInteger)index;
- (instancetype)initWithTableView:(NSInteger)count andDelegate:(id<ScrollTableViewDelegate>)delegate;

- (void)refreshTableViewWithSection:(NSInteger)index;
- (void)scrollTableViewListWithSection:(NSInteger)section;

@end
