//
//  DJNavigationController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/11.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJNavigationController.h"

@interface DJNavigationController ()

@end

@implementation DJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *att = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationBar setTitleTextAttributes:att];
    
    
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    
//    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    if (self.viewControllers.count) {
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"" normalImage:@"NavBack" heightlightImage:@"NavBack" target:self action:@selector(backBtnClick)];
    }
    
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    
}


-(void)backBtnClick{

    [self popViewControllerAnimated:YES];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
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
