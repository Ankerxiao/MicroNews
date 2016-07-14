//
//  DetailVC.m
//  MicroNews
//
//  Created by Anker Xiao on 16/7/8.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,copy) NSString *urlStr;
@end

@implementation DetailVC

- (instancetype)initWithUrlString:(NSString *)urlStr
{
    if(self = [super init])
    {
        self.urlStr = urlStr;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlStr]];
    self.webView.frame = self.view.bounds;
//    _webView.delegate = self;
    [self.webView loadRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
