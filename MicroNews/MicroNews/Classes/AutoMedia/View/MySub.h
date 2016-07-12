//
//  MySub.h
//  MicroNews
//
//  Created by Anker Xiao on 16/7/11.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MySubDelegate <NSObject>

- (void)changeView;

@end

@interface MySub : UIView

@property (nonatomic,weak) id <MySubDelegate> delegate;

@end
