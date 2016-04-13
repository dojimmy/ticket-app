//
//  DJProduct.m
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJProduct.h"

@implementation DJProduct

+(NSArray *)product{

    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"more_project" ofType:@"json"]];
    
    NSArray *dicArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *desArr = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArr) {
        DJProduct *product = [DJProduct productWithDic:dic];
        
        [desArr addObject:product];
    }
    
    return desArr;

}


+(instancetype)productWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
    
}

-(instancetype)initWithDic:(NSDictionary *)dic{

    if (self = [super init]) {
        
        self.identifier = dic[@"id"];
        
        self.icon = dic[@"icon"];
        
        self.url = dic[@"url"];
        
        self.customUrl = dic[@"customUrl"];
        
        self.title = dic[@"title"];
        
        self.stitle = dic[@"stitle"];
        
    }
    return self;
}
@end
