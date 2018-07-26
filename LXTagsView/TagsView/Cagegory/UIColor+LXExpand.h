//
//  UIColor+LXExpand.h
//  testDemo
//
//  Created by 漫漫 on 2018/4/4.
//  Copyright © 2018年 刘新新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LXExpand)
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
+(UIColor *) hexStringToColor: (NSString *) stringToConvert andAlpha:(CGFloat)alpha;

@end
