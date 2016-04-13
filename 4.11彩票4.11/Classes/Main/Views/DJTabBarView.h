//
//  DJTabBarView.h
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/11.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJTabBarView;

@protocol DJTabBarViewDelegate <NSObject>

-(void)tabBarButtonClick:(DJTabBarView *)tabBarView andSelectedTag:(NSInteger)selectedTag;

@end
@interface DJTabBarView : UIView

@property (nonatomic,weak) id <DJTabBarViewDelegate>delegate;


-(void)createBarButtonWithNormalImg:(UIImage *)normalImg heighlightedImg:(UIImage *)heighlightedImg;

@end
