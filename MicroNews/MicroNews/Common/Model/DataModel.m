//
//  DataModel.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/5.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

+ (JSONKeyMapper *)keyMapper
{
    JSONKeyMapper *mapper = [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"descrip"}];
    return mapper;
}

@end
