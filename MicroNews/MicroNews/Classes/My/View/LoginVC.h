//
//  LoginVC.h
//  
//
//  Created by Anker Xiao on 16/7/15.
//
//

#import <UIKit/UIKit.h>

@protocol LoginVCDelegate <NSObject>

- (void)passValue:(BOOL)boolean;

@end

@interface LoginVC : UIViewController

@property (nonatomic,weak) id <LoginVCDelegate> delegate;

@end
