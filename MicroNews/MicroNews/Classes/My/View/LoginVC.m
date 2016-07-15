//
//  LoginVC.m
//  
//
//  Created by Anker Xiao on 16/7/15.
//
//

#import "LoginVC.h"
#import "NetManager.h"
#import <TencentOpenAPI/TencentOAuth.h>

#define API_SERVER @"http://10.11.57.27/mcmp1605/data_enter.php"
#define USER_LOGIN @"method=user_login&tel=%@&pass=%@"

@interface LoginVC () <TencentSessionDelegate>
{
    TencentOAuth *_tencentOAuth;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@end

@implementation LoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"登录";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loginWithQQ)];
    [self.imageV addGestureRecognizer:tap];
}

- (void)loginWithQQ
{
    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:@"1105545630" andDelegate:self];
    NSArray *permissions = [NSArray arrayWithObjects:@"get_user_info", @"get_simple_userinfo", @"add_t", nil];
    [_tencentOAuth authorize:permissions inSafari:YES];
}

- (void)tencentDidLogin
{
    [_tencentOAuth getUserInfo];
}

- (void)getUserInfoResponse:(APIResponse *)response
{
    NSLog(@"%@",response);
    ;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:response.jsonResponse[@"figureurl_qq_2"]]]];
        [imgV setImage:img];
        
//        [self.view addSubview:imgV];
    });
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
