//
//  DJPushViewController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/13.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJScoreViewController.h"

@interface DJScoreViewController ()

@property (nonatomic) UIDatePicker *picker;

@property (nonatomic) UITableViewCell *cell;

@end

@implementation DJScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section==0) {
        return;
    }
    
    UITextField *textField = [[UITextField alloc] init];
    
    [textField becomeFirstResponder];
    self.picker = [[UIDatePicker alloc] init];
    
    _picker.datePickerMode = UIDatePickerModeTime;
    
    _picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    textField.inputView = self.picker;
    
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];

    bar.barTintColor = [UIColor redColor];
//    bar.backgroundColor = [UIColor redColor];
    
    UIBarButtonItem *cancel = [UIBarButtonItem itemWithTitle:@"取消" normalImage:nil heightlightImage:nil target:self action:@selector(cancelBtnClick)];
    
    UIBarButtonItem *confirm = [UIBarButtonItem itemWithTitle:@"确定" normalImage:nil heightlightImage:nil target:self action:@selector(confirmBtnClick)];
    
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    bar.items = @[cancel,flex,confirm];
    
    textField.inputAccessoryView = bar;
    
    self.cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self.cell addSubview:textField];
}


-(void)cancelBtnClick{

    [self.view endEditing:YES];
}

-(void)confirmBtnClick{

    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    
    formater.dateFormat = @"HH:mm";
    
    NSString *time = [formater stringFromDate:self.picker.date];
    
    self.cell.detailTextLabel.text = time;
    
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
