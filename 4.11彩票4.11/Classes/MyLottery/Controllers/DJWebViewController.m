//
//  DJWebViewController.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/13.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJWebViewController.h"

@interface DJWebViewController ()<UIWebViewDelegate>

@end

@implementation DJWebViewController

-(void)loadView{

    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = (UIWebView *)self.view;
    
    webView.delegate = self;
    
//    NSString *urlName = [[NSBundle mainBundle] pathForResource:self.help.html ofType:nil];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.help.html withExtension:nil];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

    NSString *jsCode = [NSString stringWithFormat:@"document.location.href = '#%@';",self.help.identifier];
    
    [webView stringByEvaluatingJavaScriptFromString:jsCode];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
