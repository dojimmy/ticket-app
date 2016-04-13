//
//  DJHelp.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/13.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJHelp.h"

@implementation DJHelp

+(NSArray *)help{

    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"help" ofType:@"json"]];
    
    NSArray *dicArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *desArr = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArr) {
        DJHelp *help = [DJHelp helpWithDic:dic];
        
        [desArr addObject:help];
    }
    
    return desArr;
}

+(instancetype)helpWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
    
}

-(instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        self.identifier = dic[@"id"];
        
        self.html = dic[@"html"];
        
        self.title = dic[@"title"];

    }
    return self;
}

@end
