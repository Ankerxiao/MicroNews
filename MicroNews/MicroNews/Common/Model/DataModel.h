//
//  DataModel.h
//  MicroNews
//
//  Created by Anker Xiao on 16/7/5.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DataModel : JSONModel

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *thumb;
@property (nonatomic,copy) NSArray *extra;
@property (nonatomic,copy) NSString *account_name;
@property (nonatomic,copy) NSString *wurl;
//@property (nonatomic,copy) NSString *input_time;

@end
