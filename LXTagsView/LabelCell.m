//
//  LabelCell.m
//  LXTagsView
//
//  Created by 万众创新 on 2018/7/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "LabelCell.h"
#import "LXTagsView.h"
@interface LabelCell()
@property (nonatomic ,strong)LXTagsView *tagsView;

@property (nonatomic ,strong)UIView *container;

@end
@implementation LabelCell
-(void)setItems:(NSArray *)items{
    _items = items;
    self.tagsView.dataA = items;
    [self.contentView layoutIfNeeded];
    
    
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        

        self.tagsView =[[LXTagsView alloc]init];
        self.tagsView.layer.borderWidth = 1;
        self.tagsView.layer.borderColor = [UIColor redColor].CGColor;
        [self.contentView addSubview:self.tagsView];

        [self.tagsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.contentView);
        }];
        
        self.tagsView.tagClick = ^(NSString *tagTitle) {
            NSLog(@"cell打印---%@",tagTitle);
        };
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
