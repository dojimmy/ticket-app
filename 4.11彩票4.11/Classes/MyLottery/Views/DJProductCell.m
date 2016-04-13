//
//  DJProductCell.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJProductCell.h"

@interface DJProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleView;


@end

@implementation DJProductCell

-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.iconView.layer.cornerRadius = 8;
    
    self.iconView.layer.masksToBounds = YES;
    
}


-(void)setProduct:(DJProduct *)product{

    _product = product;
    
    self.iconView.image = [UIImage imageNamed:product.icon];
    
    self.titleView.text = product.title;
    
    
    
    
}








- (void)awakeFromNib {
    // Initialization code
}

@end
