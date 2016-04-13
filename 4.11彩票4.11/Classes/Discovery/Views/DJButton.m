//
//  DJButton.m
//  4.11幸运转盘4.11
//
//  Created by 邓金明 on 16/4/11.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJButton.h"

@implementation DJButton

-(void)setHighlighted:(BOOL)highlighted{

    
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat w = 40;
    CGFloat h = 47;
    
    CGFloat y = 20;
    
    CGFloat x = (contentRect.size.width - w) / 2;
    
    return CGRectMake(x, y, w, h);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
