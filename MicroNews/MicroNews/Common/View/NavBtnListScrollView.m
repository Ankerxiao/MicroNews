//
//  NavBtnListScrollView.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "NavBtnListScrollView.h"

#define BTN_WIDTH 40
#define BTN_DISTANCE 5
#define BTN_HEIGHT 30
#define BTN_TAG_BEGIN 100
//#define NAV_HEIGHT 44
//#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface NavBtnListScrollView () <UIScrollViewDelegate>

@property (nonatomic,assign) CGFloat key;
@property (nonatomic,assign) BOOL isFirstL;
@property (nonatomic,assign) BOOL isFirstR;
@property (nonatomic,copy) NSArray *titleArray;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *btnBackgroundView;

@end

@implementation NavBtnListScrollView

- (NSArray *)titleArray
{
    if(nil == _titleArray)
    {
        _titleArray = [NSArray array];
    }
    return _titleArray;
}

- (UIScrollView *)scrollView
{
    if(nil == _scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
//        _scrollView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, BTN_WIDTH, BTN_HEIGHT);
    }
    return _scrollView;
}

- (instancetype)initWithBtnTitleArray:(NSArray *)btnTitleArray
{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAV_HEIGHT)])
    {
        self.titleArray = btnTitleArray;
        self.isFirstL = YES;
        self.isFirstR = YES;
        [self initNavBtnViews];
    }
    return self;
}

- (void)initNavBtnViews
{
    self.scrollView.showsHorizontalScrollIndicator = NO;
//    self.scrollView.pagingEnabled = YES;
    NSInteger count = self.titleArray.count;
    for(int i=0;i<count;i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*(BTN_WIDTH+BTN_DISTANCE), (NAV_HEIGHT-BTN_HEIGHT)/2, BTN_WIDTH, BTN_HEIGHT);
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i + BTN_TAG_BEGIN;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        
        if(i == 0)
        {
            btn.selected = YES;
            self.btnBackgroundView = [[UIView alloc] initWithFrame:btn.frame];
            self.btnBackgroundView.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame)+5, btn.frame.size.width, 2);
            self.btnBackgroundView.backgroundColor = [UIColor greenColor];
            self.scrollView.contentOffset = CGPointMake(0, 0);
            [self.scrollView addSubview:self.btnBackgroundView];
        }
        [self.scrollView addSubview:btn];
    }
    [self.scrollView setContentSize:CGSizeMake((self.titleArray.count)*(BTN_WIDTH+BTN_DISTANCE), NAV_HEIGHT)];
    [self addSubview:self.scrollView];
}

- (void)pressBtn:(UIButton *)btn
{
    NSInteger index = 0;
    for(UIView *view in [_scrollView subviews])
    {
        if([view isKindOfClass:[UIButton class]])
        {
            UIButton *btnTemp = (UIButton*)view;
            btnTemp.selected = NO;
            if([btnTemp isEqual:btn])
            {
                btnTemp.selected = YES;
                if(self.delegate != nil && [self.delegate respondsToSelector:@selector(didSelectedBtnWithIndex:)])
                {
                    [self.delegate didSelectedBtnWithIndex:index];
                }
                [UIView animateWithDuration:0.5 animations:^{
                    _btnBackgroundView.frame = CGRectMake(btnTemp.frame.origin.x, CGRectGetMaxY(btnTemp.frame)+5, btnTemp.frame.size.width, 3);
//                if(btnTemp.frame.origin.x > SCREEN_WIDTH)
//                {
//                    CGPoint po = _scrollView.contentOffset;
//                    po.x += BTN_WIDTH + BTN_DISTANCE;
//                    _scrollView.contentOffset = po;
//                }
                }];
            }
            index++;
        }
    }
}

- (void)scrollBtnListWithIndex:(NSInteger)btnIndex
{
    UIButton *btn = [_scrollView viewWithTag:btnIndex+BTN_TAG_BEGIN];
    NSInteger index = 0;
    for(UIView *view in [_scrollView subviews])
    {
        if([view isKindOfClass:[UIButton class]])
        {
            UIButton *btnTemp = (UIButton *)view;
            btnTemp.selected = NO;
            if([btnTemp isEqual:btn])
            {
                btnTemp.selected = YES;
                [UIView animateWithDuration:0.5 animations:^{
                    _btnBackgroundView.frame = CGRectMake(btnTemp.frame.origin.x, CGRectGetMaxY(btnTemp.frame)+5, btnTemp.frame.size.width, 2);;
            }];
                static CGPoint po;
                self.key = po.x;
                po = _scrollView.contentOffset;
                
                if(btnTemp.frame.origin.x > 2*(BTN_WIDTH + BTN_DISTANCE) && btnTemp.frame.origin.x < (self.titleArray.count-5)*(BTN_WIDTH + BTN_DISTANCE))
                {
                    if(self.isFirstR)
                    {
                        po.x += BTN_WIDTH + BTN_DISTANCE;
                        self.isFirstR = NO;
                    }
                    else if(po.x > self.key && !self.isFirstR) //向右滑动
                    {
                        po.x += BTN_WIDTH + BTN_DISTANCE;
                        self.isFirstR = NO;
                    }
                    else if(self.isFirstL)
                    {
                        po.x -= BTN_WIDTH + BTN_DISTANCE;
                        self.isFirstL = NO;
                    }
                    else if(po.x < self.key && !self.isFirstL)
                    {
                        po.x -= BTN_WIDTH + BTN_DISTANCE;
                        self.isFirstL = NO;
                    }
                }
                _scrollView.contentOffset = po;
            }
        }
        index++;
    }
}

@end
