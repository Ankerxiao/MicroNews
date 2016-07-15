//
//  DatabaseManager.h
//  CommonFunction
//
//  Created by Anker Xiao on 16/6/30.
//  Copyright © 2016年 Anker Xiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface DatabaseManager : NSObject

+ (id)sharedDatabaseManager;
- (instancetype)initWithDBName:(NSString *)strName andTableName:(NSString *)strTableName andField:(id)fieldName,...;
- (BOOL)insertDataWithArray:(NSArray *)array;
- (BOOL)tableIsNull;//表是否为空
@end
