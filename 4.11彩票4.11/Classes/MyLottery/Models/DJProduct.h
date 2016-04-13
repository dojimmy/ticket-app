//
//  DJProduct.h
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/12.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJProduct : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *stitle;

@property (nonatomic,copy) NSString *identifier;

@property (nonatomic,copy) NSString *url;

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,copy) NSString *customUrl;

//+(instancetype)productWithDic:(NSDictionary *)dic;
//
//-(instancetype)initWithDic:(NSDictionary *)dic;


+(NSArray *)product;

@end
