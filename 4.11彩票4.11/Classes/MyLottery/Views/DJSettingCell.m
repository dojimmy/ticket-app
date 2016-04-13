//
//  DJSettingCell.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJSettingCell.h"

@implementation DJSettingCell


+(instancetype)cellWithTableView:(UITableView *)tableView withItems:(NSDictionary *)items;{

    NSString *ID = @"";
    
    if (items[@"UITableViewCellStyle"] && [items[@"UITableViewCellStyle"] length] > 0) {
        ID = items[@"UITableViewCellStyle"];
    }
    else{
    
        ID = @"UITableViewCellStyleDefault";
    }
    DJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[DJSettingCell alloc] initWithStyle:[self setUpCellStyleWithItems:items] reuseIdentifier:ID];
    }
    return cell;
}


+(UITableViewCellStyle)setUpCellStyleWithItems:(NSDictionary *)items{

    if ([items[@"UITableViewCellStyle"] isEqualToString:@"UITableViewCellStyleValue1"]) {
        
        return UITableViewCellStyleValue1;
        
    }else if ([items[@"UITableViewCellStyle"] isEqualToString:@"UITableViewCellStyleValue1"]) {
        
        return UITableViewCellStyleValue2;
        
    }else if ([items[@"UITableViewCellStyle"] isEqualToString:@"UITableViewCellStyleSubtitle"]){
        
        return UITableViewCellStyleSubtitle;
    }else{
    
        return UITableViewCellStyleDefault;
    
    }

}




-(void)setItems:(NSDictionary *)items{

    _items = items;
    
    if(items[@"icon"] && [items[@"icon"] length] > 0){
        self.imageView.image = [UIImage imageNamed:items[@"icon"]];
    }
    
    
    self.textLabel.text = items[@"title"];
    
    self.detailTextLabel.text = items[@"subTitle"];
    
    
    Class cla = NSClassFromString(items[@"accessoryView"]);
    
    id obj = [[cla alloc] init];
    
    if ([obj isKindOfClass:[UIImageView class]]) {
        
        UIImageView *imgView = (UIImageView *)obj;
        
        imgView.image = [UIImage imageNamed:@"arrow_right"];
        
        [imgView sizeToFit];
        
        self.accessoryView = imgView;
        
    }else if ([obj isKindOfClass:[UISwitch class]]){
    
        UISwitch *swich = (UISwitch *)obj;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        swich.on = [defaults boolForKey:items[@"switchKey"]];
        
        [swich addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventValueChanged];
        
        self.accessoryView = swich;
    }
    
}

-(void)switchBtnClick:(UISwitch *)swich{

    NSUserDefaults *defaut = [NSUserDefaults standardUserDefaults];
    
    [defaut setBool:swich.on forKey:self.items[@"switchKey"]];
    
    [defaut synchronize];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
