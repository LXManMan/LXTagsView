//
//  LXTagsView.h
//  TestDemo
//
//  Created by 万众创新 on 2018/7/25.
//  Copyright © 2018年 万众创新. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^LXTagClick)(NSString *tagTitle);
@interface LXTagsView : UIView
/*
 * 标签数组
 */
@property (nonatomic ,strong)NSArray *dataA;

/*
 * 回调
 */
@property (nonatomic ,copy)LXTagClick tagClick;
@end
