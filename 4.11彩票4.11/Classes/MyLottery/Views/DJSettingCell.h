//
//  DJSettingCell.h
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJSettingCell : UITableViewCell


+(instancetype)cellWithTableView:(UITableView *)tableView withItems:(NSDictionary *)items;

@property (nonatomic) NSDictionary *items;

@end
