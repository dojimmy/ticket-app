//
//  UIBarButtonItem+Extension.m
//  4.2彩票4.2
//
//  Created by 邓金明 on 16/4/7.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithTitle:(NSString *)title normalImage:(NSString *)normalImage heightlightImage:(NSString *)heightlightImage target:(id)target action:(SEL)action{

    UIButton *btn = [[UIButton alloc] init];
    
    if (title !=nil && ![title isEqualToString:@""]) {
        
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
    if (normalImage !=nil && ![normalImage isEqualToString:@""]) {
        
        [btn setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    }
    
    
    if (heightlightImage !=nil && ![heightlightImage isEqualToString:@""]) {
        
        [btn setBackgroundImage:[UIImage imageNamed:heightlightImage] forState:UIControlStateHighlighted];
    }
    
    
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
