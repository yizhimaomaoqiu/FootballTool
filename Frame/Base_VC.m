//
//  Base_VC.m
//  Frame
//
//  Created by kk on 17/7/31.
//  Copyright © 2017年 程国治. All rights reserved.
//

#import "Base_VC.h"

@interface Base_VC ()

@end

@implementation Base_VC

- (void)dissmiss{
    
    NSArray *viewcontrollers = self.navigationController.viewControllers;
    
    if (viewcontrollers.count > 1) {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self) {
            //push方式
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        //present方式
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    BackBarButtonItem *back = [BackBarButtonItem target:self action:@selector(dissmiss)];
    self.navigationItem.leftBarButtonItem = back;
    
    self.dataArr = [NSMutableArray array];
    self.titleArr = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.separatorStyle = YES;
    self.tableView.separatorColor = LINECOLOR;
    self.tableView.backgroundColor = BACKCOLOR;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    
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
