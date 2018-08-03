//
//  One_VC.m
//  Frame
//
//  Created by admin on 18/4/9.
//  Copyright © 2018年 程国治. All rights reserved.
//

#import "One_VC.h"
#import "ZeXian_VC.h"
#import "QuXian_VC.h"
@interface One_VC ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation One_VC

- (void)peilvlue{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"赔付率计算" message:@"填写北单的主平客, 和竞彩的主平客" preferredStyle:UIAlertControllerStyleAlert];
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
        CGFloat zhupeifulv = 1.0 / [arr[0] floatValue] * [arr[3] floatValue];
        CGFloat pingpeifulv = 1.0 / [arr[1] floatValue] * [arr[4] floatValue];
        CGFloat kepeifulv = 1.0 / [arr[2] floatValue] * [arr[5] floatValue];
        NSString *result = [NSString stringWithFormat:@"%%%.2f\n%%%.2f\n%%%.2f", zhupeifulv * 100, pingpeifulv * 100, kepeifulv * 100];
        
        UIAlertController *alC = [UIAlertController alertControllerWithTitle:@"结果" message:result preferredStyle:UIAlertControllerStyleAlert];
        [alC addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alC animated:YES completion:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

//添加第一步
- (void)action{
    UIAlertController *alC = [UIAlertController alertControllerWithTitle:@"场次" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType =  UIKeyboardTypeNumberPad;
    }];
    [alC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textFie = alC.textFields.firstObject;
        [self zhu:textFie.text];
    }]];
    [self presentViewController:alC animated:YES completion:nil];
}
//添加第二步
- (void)zhu:(NSString *)bianhao{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"填写主场球数" message:nil preferredStyle:UIAlertControllerStyleAlert];
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
        [self ke:bianhao zhuArr:arr];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)ke:(NSString *)bianhao zhuArr:(NSArray *)zhuArr{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"填写客场球数" message:nil preferredStyle:UIAlertControllerStyleAlert];
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
        [self ping:bianhao zhuArr:zhuArr keArr:arr];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)ping:(NSString *)bianhao zhuArr:(NSArray *)zhuArr keArr:(NSArray *)keArr{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"填写平数" message:@"分别填写\n主20场平数\n主10场平数\n主6场平数\n客20场平数\n客10场平数\n客6场平数" preferredStyle:UIAlertControllerStyleAlert];
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
        [self chuncu:bianhao zhuArr:zhuArr keArr:keArr pingArr:arr];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)chuncu:(NSString *)bianhao zhuArr:(NSArray *)zhuArr keArr:(NSArray *)keArr pingArr:(NSArray *)pingArr{
    NSMutableArray *dataArr = [self read];
    [dataArr addObject:@{@"num":bianhao,
                         @"zhu":zhuArr,
                         @"ke":keArr,
                         @"ping":pingArr,
                         @"result":@"",
                         }];
    [self write:dataArr];
    self.dataArr = dataArr;
    [self.tableView reloadData];
}

- (void)gongneng{
    
    UIAlertController *alC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alC addAction:[UIAlertAction actionWithTitle:@"清除数据" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIAlertController *alC = [UIAlertController alertControllerWithTitle:@"确定清空所有信息吗" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self clear];
            [self.tableView reloadData];
            [SVProgressHUD showSuccessWithStatus:@"已删除所有数据"];
        }]];
        [alC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alC animated:YES completion:nil];
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"保存数据至沙盒" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *path = [NSString stringWithFormat:@"%@/data.json", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject]];
        NSDictionary *dic = @{@"data":self.dataArr};
        [dic.dicToJson writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"path = %@", path);
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"北单赔付率计算" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self peilvlue];
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"主数据";
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(action)];
    self.navigationItem.rightBarButtonItem = item1;
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"功能" style:UIBarButtonItemStylePlain target:self action:@selector(gongneng)];
    self.navigationItem.leftBarButtonItem = item2;
    
    self.view.backgroundColor = [UIColor greenColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataArr = [self read];
    [self.tableView reloadData];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellStr];
    }
    NSDictionary *dic = self.dataArr[indexPath.row];
    NSArray *zhu = dic[@"zhu"];
    NSArray *ke = dic[@"ke"];
    NSArray *ping = dic[@"ping"];
    cell.textLabel.text = dic[@"num"];
    cell.textLabel.font = Font(18);
    cell.detailTextLabel.font = Font(15);
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"主:   %@\n客:   %@\n主平20、主平10、主平6、客平20、客平10、客平6: %@ \n:彩果:%@", [zhu componentsJoinedByString:@","], [ke componentsJoinedByString:@","], [ping componentsJoinedByString:@"、"], dic[@"result"]];
    cell.detailTextLabel.textAlignment = NSTextAlignmentLeft;
    cell.detailTextLabel.numberOfLines = 0;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
    UITableViewRowAction *row = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.dataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self write:self.dataArr];
    }];
    UITableViewRowAction *row1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"添加结果" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"填写结果" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
        }];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSDictionary *dic = self.dataArr[indexPath.row];
            NSMutableDictionary *mudic = [NSMutableDictionary dictionaryWithDictionary:dic];
            UITextField *textfile = alertController.textFields.firstObject;
            [mudic setValue:textfile.text forKey:@"result"];
            [self.dataArr replaceObjectAtIndex:indexPath.row withObject:mudic];
            [self write:self.dataArr];
            [self.tableView reloadData];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
    row1.backgroundColor = [UIColor orangeColor];
    return @[row, row1];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.dataArr[indexPath.row];
    UIAlertController *alC = [UIAlertController alertControllerWithTitle:@"加减球" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alC addAction:[UIAlertAction actionWithTitle:@"+1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self push:dic jiajianqiu:1];
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"+2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self push:dic jiajianqiu:2];
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"-1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self push:dic jiajianqiu:-1];
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"-2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self push:dic jiajianqiu:-1];
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"0" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self push:dic jiajianqiu:0];
    }]];
    [alC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alC animated:YES completion:nil];
}

- (void)push:(NSDictionary *)dic jiajianqiu:(NSInteger)jiajianqiu{
    NSArray *zhu = dic[@"zhu"];
    NSArray *ke = dic[@"ke"];
    NSArray *result = [self jisuan:zhu :ke];
    QuXian_VC *vc = [[QuXian_VC alloc]init];
    vc.jiajianqiu = jiajianqiu;
    vc.zhuArr = @[result[5], result[4], result[3], result[2], result[1], result[0]];
    vc.keArr = @[result[11], result[10], result[9], result[8], result[7], result[6]];
    vc.pingArr = dic[@"ping"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
//    UIAlertController *alC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    [alC addAction:[UIAlertAction actionWithTitle:@"折线图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        ZeXian_VC *vc = [[ZeXian_VC alloc]init];
//        vc.jiajianqiu = jiajianqiu;
//        vc.zhuArr = @[result[2], result[1], result[0]];
//        vc.keArr = @[result[5], result[4], result[3]];
//        vc.pingArr = dic[@"ping"];
//        [self.navigationController pushViewController:vc animated:YES];
//    }]];
//    [alC addAction:[UIAlertAction actionWithTitle:@"曲线图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        QuXian_VC *vc = [[QuXian_VC alloc]init];
//        vc.jiajianqiu = jiajianqiu;
//        vc.zhuArr = @[result[2], result[1], result[0]];
//        vc.keArr = @[result[5], result[4], result[3]];
//        vc.pingArr = dic[@"ping"];
//        [self.navigationController pushViewController:vc animated:YES];
//    }]];
//    [alC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }]];
//    [self presentViewController:alC animated:YES completion:nil];
//
}

- (NSArray *)jisuan:(NSArray *)zhu :(NSArray *)ke{

    CGFloat zhu6 = 0;
    CGFloat zhu7 = 0;
    CGFloat zhu8 = 0;
    CGFloat zhu9 = 0;
    CGFloat zhu10 = 0;
    CGFloat zhu20 = 0;
    CGFloat he = 0;
    for (NSInteger i = 0; i  < 20; i ++) {
        he = he + [zhu[i] floatValue];
        if (i == 5) {
            zhu6 = he;
        }
        if (i == 6) {
            zhu7 = he;
        }
        if (i == 7) {
            zhu8 = he;
        }
        if (i == 8) {
            zhu9 = he;
        }
        if (i == 9) {
            zhu10 = he;
        }
        if (i == 19) {
            zhu20 = he;
        }
    }
    
    CGFloat ke6 = 0;
    CGFloat ke7 = 0;
    CGFloat ke8 = 0;
    CGFloat ke9 = 0;
    CGFloat ke10 = 0;
    CGFloat ke20 = 0;
    he = 0;
    for (NSInteger i = 0; i  < 20; i ++) {
        he = he + [ke[i] floatValue];
        if (i == 5) {
            ke6 = he;
        }
        if (i == 6) {
            ke7 = he;
        }
        if (i == 7) {
            ke8 = he;
        }
        if (i == 8) {
            ke9 = he;
        }
        if (i == 9) {
            ke10 = he;
        }
        if (i == 19) {
            ke20 = he;
        }
    }
    return @[@(zhu6 / 6), @(zhu7 / 7), @(zhu8 / 8), @(zhu9 / 9), @(zhu10 / 10), @(zhu20 / 20), @(ke6 / 6), @(ke7 / 7), @(ke8 / 8), @(ke9 / 9), @(ke10 / 10), @(ke20 / 20)];
}

- (void)write:(NSMutableArray *)arr{
    
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:arr forKey:@"data"];
    [userdefaults synchronize];
}

- (NSMutableArray *)read{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arr = [userdefaults objectForKey:@"data"];
    if (!arr) {
        return [NSMutableArray array];
    }else{
        return [NSMutableArray arrayWithArray:arr];
    }
}

- (void)clear{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults removeObjectForKey:@"data"];
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
