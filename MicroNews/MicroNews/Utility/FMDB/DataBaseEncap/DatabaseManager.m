//
//  DatabaseManager.m
//  CommonFunction
//
//  Created by Anker Xiao on 16/6/30.
//  Copyright © 2016年 Anker Xiao. All rights reserved.
//

#import "DatabaseManager.h"

@interface DatabaseManager ()
{
    FMDatabase *_dababase;
    NSString *_strDBName;
    NSString *_strTableName;
    NSArray *_parameterArray;
}
@end

@implementation DatabaseManager

//单例
+ (instancetype)sharedDatabaseManager
{
    static DatabaseManager *manager = nil;
    @synchronized (self)
    {
        if(nil == manager)
        {
            manager = [[DatabaseManager alloc] init];
        }
    }
    return manager;
}

//初始化数据库，并且建表，可变参数的第一个参数最好是主键
- (instancetype)initWithDBName:(NSString *)strDBName andTableName:(NSString *)strTableName andField:(id)fieldName,...
{
    //将数据库名和表名存入全局变量，方便后面的插入
    _strDBName = strDBName;
    _strTableName = strTableName;
    
    
    /*
     定义一个可变数组，存放可变参数，也就是表中的各个字段名
     */
    NSMutableArray *paramArray = [NSMutableArray array];
    va_list params; //定义一个指向可变参数列表的指针
    va_start(params, fieldName); //得到第一个可变参数地址
    id arg;
    if(fieldName)
    {
        id para = fieldName;
        [paramArray addObject:para];
        while((arg = va_arg(params, id)))
        {
            if(arg)
            {
                [paramArray addObject:arg];
            }
        }
        va_end(params);
    }
    
//    //测试代码
//    for(int i=0;i<paramArray.count;i++)
//    {
//        NSLog(@"%@",paramArray[i]);
//    }
    _parameterArray = [NSArray arrayWithArray:paramArray];//将字段存入全局变量
    
    if(self = [super init])
    {
        //创建数据库路径
        NSString *dbPath = [NSString stringWithFormat:@"%@/Documents/%@.db",NSHomeDirectory(),strDBName];
        NSLog(@"%@",dbPath);
        _dababase = [[FMDatabase alloc] initWithPath:dbPath];
        if([_dababase open]) //打开数据库，也就是判断数据库是否创建成功
        {
            NSMutableString *strSum = [NSMutableString string];
            for(int i=0;i<paramArray.count;i++)
            {
                NSString *str = [NSString string];
                if(i == paramArray.count-1)
                {
                    str = [NSString stringWithFormat:@"%@ varchar(1024)",paramArray[i]];
                }
                else
                {
                    str = [NSString stringWithFormat:@"%@ varchar(1024),",paramArray[i]];
                }
                [strSum appendString:str];
            }
            NSString *sqlStr = [NSString stringWithFormat:@"create table if not exists %@(%@)",strTableName,strSum];
            if([_dababase executeUpdate:sqlStr])
            {
                NSLog(@"create table success!!");
            }
            else
            {
                NSLog(@"failed to create table!!!");
            }
        }
        else
        {
            NSLog(@"create/open database failed!!!");
        }
    }
    return self;
}

//插入一条或多条数据
- (BOOL)insertDataWithArray:(NSArray *)array
{
    NSInteger count = _parameterArray.count;
    NSMutableString *paramStr = [NSMutableString string];//sql语句前面的参数
    NSMutableString *markStr = [NSMutableString string];//问号
    for(int i=0;i<count;i++)
    {
        NSString *str1 = [NSString string];
        NSString *str2 = [NSString string];
        if(i == count-1)
        {
            str1 = [NSString stringWithFormat:@"%@",_parameterArray[i]];
            str2 = @"?";
        }
        else
        {
            str1 = [NSString stringWithFormat:@"%@,",_parameterArray[i]];
            str2 = @"?,";
        }
        [paramStr appendString:str1];
        [markStr appendString:str2];
    }
    //拼接sql语句
    NSString *sqlStr = [NSString stringWithFormat:@"insert into %@(%@) values (%@)",_strTableName,paramStr,markStr];
    
    BOOL isSuccess = NO;
    for(NSDictionary *dict in array)
    {
        NSArray *pa = [paramStr componentsSeparatedByString:@","];
        switch (pa.count)
        {
            case 2:
                isSuccess = [_dababase executeUpdate:sqlStr,dict[pa[0]],dict[pa[1]]];
                break;
            case 3:
                isSuccess = [_dababase executeUpdate:sqlStr,dict[pa[0]],dict[pa[1]],dict[pa[2]]];
                break;
            case 4:
                isSuccess = [_dababase executeUpdate:sqlStr,dict[pa[0]],dict[pa[1]],dict[pa[2]],dict[pa[3]]];
                break;
            case 5:
                isSuccess = [_dababase executeUpdate:sqlStr,dict[pa[0]],dict[pa[1]],dict[pa[2]],dict[pa[3]],dict[pa[4]]];
                break;
            default:
                break;
        }
        if(isSuccess)
        {
            NSLog(@"insert success!!");
        }
        else
        {
            NSLog(@"insert failed!!");
        }
    }
    return isSuccess;
}

- (BOOL)tableIsNull
{
    NSString *querySql = [NSString stringWithFormat:@"select * from %@",_strTableName];
    FMResultSet *rs = [_dababase executeQuery:querySql];
    NSMutableArray *array = [NSMutableArray array];
    while([rs next])
    {
        NSDictionary *dict = [rs resultDictionary];
        [array addObject:dict];
    }
    if(array.count == 0)
    {
        return YES;
    }
    return NO;
}

//判断是否为空表
//- (BOOL)tableIsNull:(NSString *)tableName
//{
//    FMResultSet *rs = [_dababase executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
//    while ([rs next])
//    {
//        // just print out what we've got in a number of formats.
//        NSInteger count = [rs intForColumn:@"count"];
//        NSLog(@"isTableOK %ld", count);
//        if (0 == count)
//        {
//            return NO;
//        }
//        else
//        {
//            return YES;
//        }
//    }
//    
//    return NO;
//}


@end
