//
//  DJHallViewController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/11.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJHallViewController.h"

@interface DJHallViewController ()

@property (nonatomic,weak) UIView *cover;

@property (nonatomic,weak) UIImageView *img;

@end

@implementation DJHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (IBAction)activityBtnClick:(UIBarButtonItem *)sender {
    
    UIView *cover = [[UIView alloc] initWithFrame:kScreenSize];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.alpha = 0.6;
    
    [self.tabBarController.view addSubview:cover];
    self.cover = cover;
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    
    img.center = self.view.center;
    
    [self.tabBarController.view addSubview:img];
    
    img.userInteractionEnabled = YES;
    
    self.img = img;
    
    UIButton *closeBtn = [[UIButton alloc] init];

    [closeBtn setBackgroundImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    
    [closeBtn sizeToFit];
    
    closeBtn.frame = CGRectMake(img.bounds.size.width-closeBtn.bounds.size.width, 0, closeBtn.bounds.size.width, closeBtn.bounds.size.height);
    
    
    [img addSubview:closeBtn];
    
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)closeBtnClick{

    [UIView animateWithDuration:0.5 animations:^{
        self.cover.alpha = 0;
        self.img.alpha = 0;
    } completion:^(BOOL finished) {
       
        [self.cover removeFromSuperview];
        
        [self.img removeFromSuperview];
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
