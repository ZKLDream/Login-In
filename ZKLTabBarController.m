//
//  ZKLTabBarController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLTabBarController.h"
#import "ZKLManViewController.h"
#import "ZKLDrawViewController.h"
#import "ZKLTitleViewController.h"
#import "ZKLUsersViewController.h"
#import "ZKLNavigationController.h"

@interface ZKLTabBarController ()

@end

@implementation ZKLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViewController];
    [self.tabBar setBarTintColor:[UIColor colorWithRed:61/255.0f green:107/255.0f blue:22/255.0f alpha:1]];
}


-(void)creatViewController{
    
    ZKLManViewController *Man=[[ZKLManViewController alloc]init];
    ZKLNavigationController *Mannav=[[ZKLNavigationController alloc]initWithRootViewController:Man];
    Man.title=@"条漫";
    
    Mannav.tabBarItem.image=[[UIImage imageNamed:@"tiaoman_u"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Mannav.tabBarItem.selectedImage=[[UIImage imageNamed:@"tiaoman_d"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ZKLDrawViewController *Draw=[[ZKLDrawViewController alloc]init];
    ZKLNavigationController *DrawNav=[[ZKLNavigationController alloc]initWithRootViewController:Draw];
   
    DrawNav.title=@"绘本";
    DrawNav.tabBarItem.image=[[UIImage imageNamed:@"huiben_u"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DrawNav.tabBarItem.selectedImage=[[UIImage imageNamed:@"huiben_d"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ZKLTitleViewController *title=[[ZKLTitleViewController alloc]init];
    title.title=@"专题";
    title.tabBarItem.image=[[UIImage imageNamed:@"zhuanti_u"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    title.tabBarItem.selectedImage=[[UIImage imageNamed:@"zhuanti_d"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ZKLUsersViewController *user=[[ZKLUsersViewController alloc]init];
    ZKLNavigationController *usernav=[[ZKLNavigationController alloc]initWithRootViewController:user];
    user.title=@"我的";
    
    usernav.tabBarItem.image=[[UIImage imageNamed:@"wode_u"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    usernav.tabBarItem.selectedImage=[[UIImage imageNamed:@"wode_d"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers=@[Mannav,DrawNav,title,usernav];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:242/255.0f green:149/255.0f blue:26/255.0f alpha:1]} forState:UIControlStateSelected];
    

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
