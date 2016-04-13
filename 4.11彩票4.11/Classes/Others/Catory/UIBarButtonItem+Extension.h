//
//  UIBarButtonItem+Extension.h
//  4.2彩票4.2
//
//  Created by 邓金明 on 16/4/7.
//  Copyright © 2016年 邓金明. All rights reserved.
//
/**
 *	UIBarButtonItem分类，添加自定义按钮
 *	@param Extension	标题，正常图片，高亮图片，点击响应者，响应者方法名
 *	@return 返回UIBarButtonItem
 */
#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithTitle:(NSString *)title normalImage:(NSString *)normalImage heightlightImage:(NSString *)heightlightImage target:(id)target action:(SEL)action;
@end
