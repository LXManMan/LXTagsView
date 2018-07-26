//
//  ViewController.m
//  LXTagsView
//
//  Created by 万众创新 on 2018/7/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "LabelTableViewController.h"
#import "LXTagsView.h"
@interface ViewController ()
@property (nonatomic ,strong)LXTagsView *tagsView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.tagsView =[[LXTagsView alloc]init];
    self.tagsView.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.6];
    [self.view addSubview:self.tagsView];
    
    [self.tagsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(100);
        
    }];
    
     NSArray *array = @[@"将军百战死，马革裹尸，十万少年十万血",@"十年磨一剑，越小越就奥数",@"奶油过",@"什么东西",@"白小果",@"荔枝",@"撒外迪卡拉嘎家庭环境安静过很久爱家庭环境和生态环境是",@"他大舅他二舅都是他舅",@"巴拉巴拉小魔仙",@"笑傲江湖",@"书剑恩仇录",@"射雕英雄传",@"笑书神侠倚碧鸳，",@"漫漫"];
    self.tagsView.dataA = array;
    
    self.tagsView.tagClick = ^(NSString *tagTitle) {
        NSLog(@"View 打印--%@",tagTitle);
    };
    
}

- (IBAction)click:(id)sender {
    
    LabelTableViewController *vc =[[LabelTableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
