//
//  DJSettingViewController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJSettingViewController.h"
#import "DJSettingCell.h"

@interface DJSettingViewController ()

@property (nonatomic) NSArray *groups;

@end

@implementation DJSettingViewController

-(NSArray *)groups{

    if (_groups==nil) {
        NSString *plistName = [[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"];
        _groups = [NSArray arrayWithContentsOfFile:plistName];
    }
    return _groups;
}


-(instancetype)init{

    return [self initWithStyle:UITableViewStyleGrouped];
}

-(instancetype)initWithStyle:(UITableViewStyle)style{

    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.title = @"设置";
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSDictionary *group = self.groups[section];
    
    return [group[@"items"] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //获取组
    NSDictionary *group = self.groups[indexPath.section];
    
    //获取有多少行
    NSArray *item = group[@"items"];
    
    NSDictionary *items = item[indexPath.row];
    
    DJSettingCell *cell = [DJSettingCell cellWithTableView:tableView withItems:items];
    cell.items =  item[indexPath.row];

    
    return cell;
    
}

//选中某行做事情
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSDictionary *group = self.groups[indexPath.section];

    NSArray *items = group[@"items"];
    
    NSDictionary *item = items[indexPath.row];

    NSString *funcName = item[@"funcName"];
    
    SEL func = NSSelectorFromString(funcName);
    
    if ([self respondsToSelector:func]) {
        
        [self performSelector:func];
    }
    
    
    NSString *className = item[@"targetVC"];
    
    if (className && className.length > 0) {
        
        Class cla = NSClassFromString(className);
        
        UIViewController *targetVC = [[cla alloc] init];
        
        if ([targetVC isKindOfClass:[DJSettingViewController class]]) {
            
            DJSettingViewController *VC = (DJSettingViewController *)targetVC;
            
            VC.plistName = item[@"plistName"];
            
        }
        
        targetVC.title = item[@"title"];
        [self.navigationController pushViewController:targetVC animated:YES];
    }
    
}


-(void)checkUpdate{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"检查新版本" message:@"你当前已经是最新的版本！" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    
    [alert show];
    
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
