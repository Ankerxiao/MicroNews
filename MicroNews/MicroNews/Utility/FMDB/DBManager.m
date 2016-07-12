//
//  DBManager.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/11.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "DBManager.h"

@interface DBManager ()
{
    FMDatabase *_fmdb;
}
@end

@implementation DBManager

+ (id)sharedDBManager
{
    static DBManager *manager = nil;
    @synchronized (self)
    {
        if(manager == nil)
        {
            manager = [[DBManager alloc] init];
        }
    }
    return manager;
}

- (instancetype)init
{
    if(self = [super init])
    {
        NSString *path = [NSString stringWithFormat:@"%@/Documents/Collec.db",NSHomeDirectory()];
        _fmdb = [[FMDatabase alloc] initWithPath:path];
        if([_fmdb open])
        {
            NSString *initSql = @"create table if not exists subscribe(name varchar(100),avatar varchar(1024),good_rate varchar(100),description varchar(1024))";
            if(![_fmdb executeUpdate:initSql])
            {
                NSLog(@"Failed create table");
            }
        }
        else
        {
            NSLog(@"Failed create database!");
        }
    }
    return self;
}



@end
