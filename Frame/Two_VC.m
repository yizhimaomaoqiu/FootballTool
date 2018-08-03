//
//  Two_VC.m
//  Frame
//
//  Created by kk on 17/10/18.
//  Copyright © 2017年 程国治. All rights reserved.
//

#import "Two_VC.h"
#import "SCChartCell.h"
static NSString *reuseIdentifierChart = @"SCChartCell";
@interface Two_VC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation Two_VC

- (void)add{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"初即指" message:@"先填写主平客的初指, 在填写主平客的即指" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType =  UIKeyboardTypeNumberPad;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType =  UIKeyboardTypeNumberPad;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType =  UIKeyboardTypeNumberPad;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType =  UIKeyboardTypeNumberPad;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType =  UIKeyboardTypeNumberPad;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType =  UIKeyboardTypeNumberPad;
    }];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSMutableArray *arr= [NSMutableArray array];
        for (UITextField *textFie in alertController.textFields) {
            [arr addObject:textFie.text];
        }
        [self jieguo:arr];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)jieguo:(NSArray *)arr{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"彩果" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType =  UIKeyboardTypeNumberPad;
    }];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textFie = alertController.textFields.firstObject;
        [self.dataArr addObject:@{@"data":arr,
                                  @"result":textFie.text
                                  }];
        [self write:self.dataArr];
        [self.tableView reloadData];
        NSIndexPath* indexPat = [NSIndexPath indexPathForRow:self.dataArr.count - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPat atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"欧指图";
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = item;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.dataArr = [self read];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr = @"UITableViewCell";
    SCChartCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell = [[SCChartCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifierChart];
    }
    NSDictionary *dic = self.dataArr[indexPath.row];
    NSArray *dataArr = dic[@"data"];
    cell.str = [NSString stringWithFormat:@"初指:  %@\n即指:  %@\n结果: %@      红:主  绿:平  蓝:客", [@[dataArr[0], dataArr[1], dataArr[2]] componentsJoinedByString:@","], [@[dataArr[3], dataArr[4], dataArr[5]] componentsJoinedByString:@","], dic[@"result"]];
    cell.Yarr = @[@[dataArr[0], dataArr[3]],@[dataArr[1], dataArr[4]],@[dataArr[2], dataArr[5]]];
    [cell configUI];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (SCREEN_WIDTH - 80) + 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
    UITableViewRowAction *row = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.dataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self write:self.dataArr];
    }];
    return @[row];
}

- (void)write:(NSMutableArray *)arr{
    
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:arr forKey:@"ouzhi"];
    [userdefaults synchronize];
}

- (NSMutableArray *)read{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arr = [userdefaults objectForKey:@"ouzhi"];
    if (!arr) {
        return [NSMutableArray array];
    }else{
        return [NSMutableArray arrayWithArray:arr];
    }
}

- (void)clear{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults removeObjectForKey:@"ouzhi"];
    [userdefaults synchronize];
    [self.dataArr removeAllObjects];
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
