//
//  DJAboutHeaderView.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJAboutHeaderView.h"

@implementation DJAboutHeaderView


+(instancetype)headerView{

    return [[[NSBundle mainBundle] loadNibNamed:@"DJAboutHeaderView" owner:nil options:nil] lastObject];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
