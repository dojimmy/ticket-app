//
//  DJLuckyViewController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJLuckyViewController.h"
#import "DJRotationViewController.h"

@interface DJLuckyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightView;

@end

@implementation DJLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.lightView.animationImages = @[
                                       [UIImage imageNamed:@"lucky_entry_light0"],
                                       [UIImage imageNamed:@"lucky_entry_light1"]
                                       ];
    
    self.lightView.animationDuration = 1;
    
    self.lightView.animationRepeatCount = 0;
    
    [self.lightView startAnimating];
    
}
- (IBAction)rotateBtnClick:(UIButton *)sender {
    
//    DJRotationViewController *rotateVC = [[DJRotationViewController alloc] init];
//    
////    UIViewController *vc = [[UIViewController alloc] init];
////    vc.view.backgroundColor = [UIColor redColor];
//    
//    [self presentViewController:rotateVC animated:YES completion:nil];
    
    
    
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
