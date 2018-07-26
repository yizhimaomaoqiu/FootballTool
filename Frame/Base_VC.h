//
//  Base_VC.h
//  Frame
//
//  Created by kk on 17/7/31.
//  Copyright © 2017年 程国治. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackBarButtonItem.h"
@interface Base_VC : UIViewController

- (void)dissmiss;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataArr;

@property (nonatomic, strong)NSMutableArray *titleArr;

@end
