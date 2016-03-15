//
//  ZKLNavigationController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLNavigationController.h"

@interface ZKLNavigationController ()

@end

@implementation ZKLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:61/255.0f green:107/255.0f blue:22/255.0f alpha:1]];
    self.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor colorWithRed:187/255.0f green:158/255.0f blue:-0/255.0f alpha:1]};
    
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
