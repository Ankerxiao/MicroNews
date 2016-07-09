//
//  NavBtnListScrollView.h
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavBtnListScrollViewDelegate <NSObject>

- (void)didSelectedBtnWithIndex:(NSInteger)index;

@end

@interface NavBtnListScrollView : UIView

@property (nonatomic,weak) id <NavBtnListScrollViewDelegate> delegate;
- (instancetype)initWithBtnTitleArray:(NSArray *)btnTitleArray;
- (void)scrollBtnListWithIndex:(NSInteger)btnIndex;
@end
