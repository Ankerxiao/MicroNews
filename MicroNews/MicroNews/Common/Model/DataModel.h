//
//  DataModel.h
//  MicroNews
//
//  Created by Anker Xiao on 16/7/5.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DataModel : JSONModel

@property (nonatomic,copy) NSString <Optional> *title;
@property (nonatomic,copy) NSString <Optional> *thumb;
@property (nonatomic,copy) NSArray <Optional> *extra;
@property (nonatomic,copy) NSString <Optional> *account_name;
@property (nonatomic,copy) NSString <Optional> *wurl;
@property (nonatomic,copy) NSString <Optional> *pic;
@property (nonatomic,copy) NSString <Optional> *avatar;
@property (nonatomic,copy) NSString <Optional> *name;
@property (nonatomic,copy) NSString <Optional> *subs;
@property (nonatomic,copy) NSString <Optional> *good_rate;
@property (nonatomic,copy) NSString <Optional> *descrip;

//@property (nonatomic,copy) NSString *input_time;

@end
