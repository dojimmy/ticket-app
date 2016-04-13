//
//  DJRotationViewController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/13.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJRotationViewController.h"
#import "DJRotationView.h"
@interface DJRotationViewController ()

@end

@implementation DJRotationViewController

//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加关闭按钮
    UIButton *closeBtn = [[UIButton alloc] init];
    closeBtn.frame = CGRectMake(20, 20, 40, 40);
    
    closeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [closeBtn setTitleColor:[UIColor colorWithRed:255.0/256 green:218.0/256 blue:136.0/256 alpha:1.0] forState:UIControlStateNormal];
    
    closeBtn.layer.cornerRadius = 20;
    
    closeBtn.backgroundColor = [UIColor redColor];
    
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:closeBtn];
    
    
    //添加转盘
    DJRotationView *rotateView = [DJRotationView rotationView];
    
    rotateView.bounds = CGRectMake(0, 0, 286, 286);
    
    rotateView.center = self.view.center;
    
    [self.view addSubview:rotateView];
}

//关闭按钮点击
-(void)closeBtnClick{

    [self dismissViewControllerAnimated:YES completion:nil];
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
