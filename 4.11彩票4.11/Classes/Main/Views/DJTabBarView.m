//
//  DJTabBarView.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/11.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJTabBarView.h"
#import "DJTabBarButton.h"
@interface DJTabBarView()

@property (nonatomic,strong) DJTabBarButton *seleledBtn;

@end

@implementation DJTabBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//创建按钮
-(void)createBarButtonWithNormalImg:(UIImage *)normalImg heighlightedImg:(UIImage *)heighlightedImg{

    DJTabBarButton *btn = [[DJTabBarButton alloc] init];
    
    
    [btn setBackgroundImage:normalImg forState:UIControlStateNormal];
    
    [btn setBackgroundImage:heighlightedImg forState:UIControlStateSelected];
    
    
    [btn addTarget:self action:@selector(barButtonClick:) forControlEvents:UIControlEventTouchDown];
    
    
    [self addSubview:btn];
    
    
}

//按钮被点击
-(void)barButtonClick:(DJTabBarButton *)btn{
    
    self.seleledBtn.selected = NO;
    
    btn.selected = YES;
    
    
    self.seleledBtn = btn;
    
    if ([self.delegate respondsToSelector:@selector(tabBarButtonClick:andSelectedTag:)]) {
        [self.delegate tabBarButtonClick:self andSelectedTag:btn.tag];
    }
    
}


-(void)layoutSubviews{

    [super layoutSubviews];
    
    CGFloat w = kScreenWidth / self.subviews.count;
    CGFloat y = 0;
    CGFloat h = self.bounds.size.height;
    
    for (int i = 0; i<self.subviews.count; i++) {
        
        DJTabBarButton *btn = self.subviews[i];
        
        CGFloat x = i * w;
        
        btn.frame = CGRectMake(x, y, w, h);
        
        btn.tag = i;
        
        
        
        if (i==0) {
            [self barButtonClick:btn];
        }
    }
    
    
}

@end
