//
//  DJMyLotteryController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJMyLotteryController.h"
#import "DJSettingViewController.h"
#import "DJHelpViewController.h"

@interface DJMyLotteryController ()

@end

@implementation DJMyLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        
    
    
}
- (IBAction)settingBtnClick:(UIBarButtonItem *)sender {
    
    DJSettingViewController *setVc = [[DJSettingViewController alloc] init];
    
    setVc.plistName = @"DJSetting";
    
    setVc.title = @"设置";
    
    setVc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"常见问题" normalImage:nil heightlightImage:nil target:self action:@selector(helpBtnClick)];
    
    
    [self.navigationController pushViewController:setVc animated:YES];
    
}

- (void)helpBtnClick {

    DJHelpViewController *helpVC = [[DJHelpViewController alloc] init];
    
    [self.navigationController pushViewController:helpVC animated:YES];
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
