//
//  LabelTableViewController.m
//  LXTagsView
//
//  Created by 万众创新 on 2018/7/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "LabelTableViewController.h"
#import "LabelCell.h"
@interface LabelTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)NSMutableArray *dataA;
@property (nonatomic ,strong)UITableView *tableView;
@end

@implementation LabelTableViewController
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self configData];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource =self;
        _tableView.estimatedRowHeight = 50;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.tableFooterView =[UIView new];
        [_tableView registerClass:[LabelCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
-(void)configData{
     NSArray *array =  @[@"将军百战死，马革裹尸，十万少年十万血",@"十年磨一剑，越小越就奥数",@"奶油过",@"什么东西",@"白小果",@"荔枝",@"撒外迪卡拉嘎家庭环境安静过很久爱家庭环境和生态环境是",@"他大舅他二舅都是他舅",@"巴拉巴拉小魔仙",@"笑傲江湖",@"书剑恩仇录",@"射雕英雄传",@"笑书神侠倚碧鸳，",@"漫漫"];
    NSArray *array2 = @[@"你好啊",@"我不好",@"一点都不好",@"将军百战死，马革裹尸，十万少年十万血",@"十年磨一剑，越小越就奥数",@"奶油过",@"什么东西",@"白小果",@"荔枝",@"撒外迪卡拉嘎家庭环境安静过很久爱家庭环境和生态环境是"];
    NSArray *array3 = @[@"十年磨一剑，越小越就奥数",@"奶油过",@"什么东西",@"白小果",@"荔枝",@"撒外迪卡拉嘎家庭环境安静过很久爱家庭环境和生态环境是"];
    
    NSArray *array4 = @[@"奶油过",@"什么东西",@"白小果",@"荔枝",@"撒外迪卡拉嘎家庭环境安静过很久爱家庭环境和生态环境是",@"他大舅他二舅都是他舅",@"巴拉巴拉小魔仙",@"笑傲江湖",@"书剑恩仇录",@"射雕英雄传",@"笑书神侠倚碧鸳，",@"漫漫"];
    
    NSArray *array5 = @[@"将军百战死，马革裹尸，十万少年十万血",@"十年磨一剑，越小越就奥数",@"奶油过",@"什么东西",@"白小果",@"荔枝",@"撒外迪卡拉嘎家庭环境安静过很久爱家庭环境和生态环境是"];
    
     NSArray *array6 = @[@"我不好",@"一点都不好",@"将军百战死，马革裹尸，十万少年十万血",@"十年磨一剑，越小越就奥数",@"奶油过",@"什么东西",@"白小果",@"荔枝",@"撒外迪卡拉嘎家庭环境安静过很久爱家庭环境和生态环境是"];
    [self.dataA addObject:array];

    [self.dataA addObject:array2];
    [self.dataA addObject:array3];

    [self.dataA addObject:array4];
    [self.dataA addObject:array5];
    [self.dataA addObject:array6];


}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataA.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LabelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell =[[LabelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.items  = self.dataA[indexPath.section];

    cell.selectionStyle = 0;
    return cell;
}

-(NSMutableArray *)dataA{
    if (!_dataA) {
        _dataA =[NSMutableArray array];
    }
    return _dataA;
}


@end
