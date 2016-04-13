//
//  DJHelp.h
//  4.11彩票4.11
//
//  Created by 邓金明 on 16/4/13.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJHelp : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *html;

@property (nonatomic,copy) NSString *identifier;


+(NSArray *)help;

@end
