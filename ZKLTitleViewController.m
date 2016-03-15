//
//  ZKLTitleViewController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLTitleViewController.h"

@interface ZKLTitleViewController ()

@end

@implementation ZKLTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
}

-(void)creatUI{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"zhuanti_bg"];
    [self.view addSubview:imageView];
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 700)];
    lable.text=@"在这次考试中,虽然题还是比较简单，因为老师都讲过了，但是在中途遇到了一点麻烦，写的时候出了点小错误，错误真的是很难找，bug；我想要多锻炼一下我们找bug的能力，还有UI阶段的学习，整体还是可以理解，就是内容特别杂乱，感觉很多，没太去整理，我想应该花时间回头整理一下我的笔记，这样才有助于自己的学习";
    
    [lable setFont:[UIFont systemFontOfSize:15]];
    
    [lable setNumberOfLines:0];
    [lable setLineBreakMode:NSLineBreakByWordWrapping];
    
    [self.view addSubview:lable];
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
