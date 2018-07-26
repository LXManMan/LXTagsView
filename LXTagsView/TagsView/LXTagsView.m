//
//  LXTagsView.m
//  TestDemo
//
//  Created by 万众创新 on 2018/7/25.
//  Copyright © 2018年 万众创新. All rights reserved.
//

#import "LXTagsView.h"
@interface LXTagsView()
@property(nonatomic,strong)NSMutableArray *tagsArray;

/*
 * 标签高度，默认为32
 */
@property (nonatomic ,assign)CGFloat tagHeight;

/*
 * 整体左右间距 默认为10
 */
@property (nonatomic ,assign)CGFloat viewHMargin;


/*
 * 整体上下间距 默认为10
 */
@property (nonatomic ,assign)CGFloat viewVMargin;


/*
 * 标签内部左右间距 默认为10
 */
@property (nonatomic ,assign)CGFloat tagInnerSpace;


/*
 * 标签之间的水平间距 默认为10  10
 */
@property (nonatomic ,assign)CGFloat tagHMargin;

/*
 * 标签之间的行间距 默认为5
 */
@property (nonatomic ,assign)CGFloat tagVMargin;

/*
 * 标签字体 默认为5
 */
@property (nonatomic ,strong)UIFont *tagFont;
/*
 * 一些边距，标签高的属性直接改动即可，多次设置会重复计算，更改默认值即可。不是为了封装，只是方便使用
 */
@end
@implementation LXTagsView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.tagsArray = [NSMutableArray array];
        self.tagHeight = 32;
        self.viewHMargin = 10;
        self.viewVMargin = 10;
        self.tagHMargin = 10;
        self.tagVMargin = 5;
        self.tagInnerSpace = 10;
    }
    return self;
}
-(void)setDataA:(NSArray *)dataA{
    _dataA = dataA;
    
    [self buildTags];
    
}
-(void)buildTags{
    
    //移除所有的tags
    for (UIButton *button in self.tagsArray) {
        [button removeFromSuperview];
    }
    
    [self.tagsArray removeAllObjects];
    
    for (int i = 0; i<_dataA.count; i++) {
        
        UIButton *button =[UIButton LXButtonNoFrameWithTitle:_dataA[i] titleFont:self.tagFont Image:nil backgroundImage:nil backgroundColor:[UIColor hexStringToColor:@"3344FF"] titleColor:[UIColor whiteColor]];
        
        kWeakSelf;
        [button addClickBlock:^(UIButton *button) {
            if (weakSelf.tagClick) {
                weakSelf.tagClick(weakSelf.dataA[i]);
            }
        }];
        
        [self.tagsArray addObject:button];
        
        [self addSubview:button];
        
    }
    //刷新布局
    [self layoutItems];
}
-(void)layoutItems{
    CGFloat viewVMargin =  self.viewVMargin;//整体上间距
    CGFloat viewHMargin = self.viewHMargin;//整体左右间距
    CGFloat tagHeight = self.tagHeight;//默认的tagHeight
    CGFloat tagLineWidth = viewHMargin;//单行的总宽度
    
    CGFloat allWidth = kScreenWidth;//总宽度
    CGFloat tagVMargin = self.tagVMargin;//标签行间距
    CGFloat tagHMargin = self.tagHMargin;//标签之间间距
    CGFloat tagInnerSpace = self.tagInnerSpace;//标签内部左右间距
    
    NSUInteger count = self.tagsArray.count;
    
    __block BOOL isChange = NO;  //是否需要换行
    
    UIButton *lastItem = nil;
    
    for (NSUInteger i = 0; i< count; i ++) {
        UIButton *item = self.tagsArray[i];
        
        NSString *tagTitle = self.dataA[i];
        CGFloat tagWidth  = [tagTitle sizeWithFont:self.tagFont maxSize:CGSizeMake(MAXFLOAT, tagHeight)].width + 2 *tagInnerSpace + 0.5; //(//masonry布局会四舍五入 + 0.5防止宽度不够)
        
        tagLineWidth +=  tagWidth + tagHMargin;
        
        //当标签长度过长 限制
        if (tagLineWidth  > allWidth - viewHMargin) {
            
            isChange = YES;
            
            //标签的长度+整体左右间距 >= 总宽度
            if (tagWidth +2 * tagHMargin >= allWidth) {
                
                tagWidth = allWidth -2 *tagHMargin;
                
                //内边距重新处理
                [item setTitleEdgeInsets:UIEdgeInsetsMake(0, tagInnerSpace/2, 0, tagInnerSpace/2)];
            }
            
            //换行从新设置当前行的长度
            tagLineWidth = viewHMargin +tagWidth + tagHMargin;
        }
        
        [item mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(tagHeight);
            make.width.mas_equalTo(tagWidth);
            
            //第一个tag设置
            if (!lastItem) {
                
                make.top.mas_equalTo(viewVMargin);
                make.left.mas_equalTo(viewHMargin);
            }else{
                
                //是否换行
                if (isChange) {
                    make.left.mas_equalTo(viewHMargin);
                    make.top.mas_equalTo(lastItem.mas_bottom).offset(tagVMargin);
                    isChange = NO;
                }else{
                    make.left.mas_equalTo(lastItem.mas_right).offset(tagHMargin);
                    make.top.mas_equalTo(lastItem.mas_top);
                }
                
            }
            
            
            
        }];
        
        lastItem = item;
        
    }
    
    //最后一个距离底部的距离
    [lastItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-viewVMargin).with.priorityHigh();
        
    }];
}


-(UIFont *)tagFont{
    if (!_tagFont) {
        _tagFont  = Font(15);
    }
    return _tagFont;
}
@end
