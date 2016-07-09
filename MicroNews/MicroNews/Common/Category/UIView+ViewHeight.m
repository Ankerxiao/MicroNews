//
//  UIView+ViewHeight.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/5.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "UIView+ViewHeight.h"

@implementation UIView (ViewHeight)

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

@end
