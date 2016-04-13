//
//  DJTitleButton.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJTitleButton.h"

@implementation DJTitleButton


-(void)layoutSubviews{

    [super layoutSubviews];

    self.titleLabel.x = 0;
    
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 4;

}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setHighlighted:(BOOL)highlighted{

}
@end
