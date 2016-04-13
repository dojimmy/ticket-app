//
//  DJTabBarController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/11.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJTabBarController.h"
#import "DJNavigationController.h"

#import "DJTabBarButton.h"
#import "DJTabBarView.h"
@interface DJTabBarController ()<DJTabBarViewDelegate>



@end

@implementation DJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UINavigationController *nav1 = [self loadViewControllerWithStoryBoardName:@"Hall"];
    
    UINavigationController *nav2 = [self loadViewControllerWithStoryBoardName:@"Arena"];
    UINavigationController *nav3 = [self loadViewControllerWithStoryBoardName:@"Discovery"];
    UINavigationController *nav4 = [self loadViewControllerWithStoryBoardName:@"History"];
    UINavigationController *nav5 = [self loadViewControllerWithStoryBoardName:@"MyLottery"];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
    
    
    DJTabBarView *tabBarView = [[DJTabBarView alloc] init];
    tabBarView.frame = self.tabBar.bounds;
    
    tabBarView.delegate = self;
//    tabBarView.backgroundColor = [UIColor redColor];
    [self.tabBar addSubview:tabBarView];
    
    
    for (int i=0; i<self.viewControllers.count; i++) {
        
        UIImage *normalImg = [UIImage imageNamed:[NSString stringWithFormat:@"TabBar%d",i+1]];
        
        UIImage *highlightedImg = [UIImage imageNamed:[NSString stringWithFormat:@"TabBar%dSel",i+1]];
        
        [tabBarView createBarButtonWithNormalImg:normalImg heighlightedImg:highlightedImg];
        
        
    }
  
}

//tabBarView代理方法
-(void)tabBarButtonClick:(DJTabBarView *)tabBarView andSelectedTag:(NSInteger)selectedTag{

    self.selectedIndex = selectedTag;
}


//加载sb
-(UINavigationController *)loadViewControllerWithStoryBoardName:(NSString *)sbName{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    
    UINavigationController *nav = [sb instantiateInitialViewController];
    
    return nav;
    
}

@end
