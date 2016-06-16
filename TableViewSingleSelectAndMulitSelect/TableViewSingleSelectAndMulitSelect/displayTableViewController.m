//
//  displayTableView.m
//  TableViewSingleSelectAndMulitSelect
//
//  Created by CrabMan on 16/6/15.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "displayTableViewController.h"
#import "Person.h"
@interface displayTableViewController ()
/**
 数据源
 */
@property (nonatomic,strong) NSMutableArray *dataArray;

/**
 单选：上一次选中的索引
 */
@property(strong,nonatomic)NSIndexPath *lastSelected;
@property (nonatomic,strong) NSMutableArray *selectedRows;

@end

@implementation displayTableViewController

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
      
        _dataArray = [NSMutableArray array];
  NSArray *titles = @[@"我就是",@"就",@"是",@"进",@"行",@"一",@"个",@"简",@"单",@"的",@"测",@"试",@"不",@"要",@"在",@"意",@"这",@"些",@"事",@"情"];
        
        for (NSString *title in titles) {
        //循环将title赋值给每个对象的title属性，制造假数据
            Person *p = [[Person alloc]init];
            p.title = title;
            p.detailTitle = title;
            [_dataArray addObject:p];
            
        }
        
    }
    return _dataArray;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
}


#pragma mark ---- UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * reuseIdentifity = @"reuseIdentifity";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifity];
    
    
    if (!cell) {
        //如果需要显示detailLabel 将cell的style设置为UITableViewCellStyleSubtitle;
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifity];
    }
    
    
    Person *p = self.dataArray[indexPath.row];
    
   
    
    cell.textLabel.text = p.title;
    cell.detailTextLabel.text = p.detailTitle;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (p.isSelected) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.transform = CGAffineTransformIdentity;
    }

    return cell;
}

/**
 单选的逻辑
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSIndexPath *temp = self.lastSelected;//暂存上一次选中的行
    if(temp && temp!=indexPath)//如果上一次的选中的行存在,并且不是当前选中的这一样,则让上一行不选中
    {
        Person *tp =self.dataArray[temp.row];
        tp.isSelected = NO;//修改之前选中的cell的数据为不选中
    
        [tableView reloadRowsAtIndexPaths:@[temp] withRowAnimation:UITableViewRowAnimationAutomatic];//刷新该行
    
    }
    self.lastSelected = indexPath;//选中的修改为当前行
    Person *p = self.dataArray[indexPath.row];
    p.isSelected = YES;//修改这个被选中的一行choon
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];//重新刷新这一行

}

/**
 复选的逻辑
 */
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    Person *p = self.dataArray[indexPath.row];
//    if (p.isSelected)//如果该行已经选择,则第二次是取消改行被选中
//    {
//        p.isSelected = NO;//取消选中
//        [self.selectedRows removeObject:@(indexPath.row)];//重数组中移除
//    }
//    else
//    {
//        p.isSelected = YES;//选中
//        [self.selectedRows addObject:@(indexPath.row)];
//    }
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];//刷新该行
//    //添加到数组中,此操作可能会导致有重复的数据
//}
@end

