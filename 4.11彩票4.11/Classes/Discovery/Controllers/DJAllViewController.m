//
//  DJAllViewController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJAllViewController.h"
#import "DJTitleButton.h"
@interface DJAllViewController ()

@property (nonatomic,strong) UIView *redView;

@end

@implementation DJAllViewController

-(UIView *)redView{


    if (_redView==nil) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 0)];
        _redView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_redView];
    }
    return _redView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    DJTitleButton *titleBtn = [[DJTitleButton alloc] init];
    
    [titleBtn setTitle:@"全部彩种" forState:UIControlStateNormal];
    
    [titleBtn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    [titleBtn sizeToFit];
    
    
    self.navigationItem.titleView = titleBtn;
    
    
    
    [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)titleBtnClick:(DJTitleButton *)btn {


    [UIView animateWithDuration:0.5 animations:^{
        btn.imageView.transform = CGAffineTransformRotate(btn.imageView.transform, M_PI);
        
        if (self.redView.height ==0) {
            self.redView.height = 100;
//            self.redView.transform = CGAffineTransformMakeTranslation(0, 100);
        }else{
        
            self.redView.height = 0;
//            self.redView.transform = CGAffineTransformMakeTranslation(0, -100);
        }
    }];
  
    
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
