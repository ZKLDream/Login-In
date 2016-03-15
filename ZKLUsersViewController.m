//
//  ZKLUsersViewController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLUsersViewController.h"
#import "ZKLDZButton.h"
#import "ZKLZhuceViewController.h"

@interface ZKLUsersViewController ()
{
    ZKLDZButton *_button;
}
@end

@implementation ZKLUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    [self NavgationBarItemSetting];
    
}

-(instancetype)init{
    
    if (self=[super init]) {
        self.ison=NO;
    }
    return self;
}

-(void)NavgationBarItemSetting{
    
    UIButton *Quitbtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [Quitbtn setTitle:@"退出" forState:UIControlStateNormal];
    [Quitbtn setTitleColor:[UIColor colorWithRed:187/255.0f green:158/255.0f blue:-0/255.0f alpha:1] forState:UIControlStateNormal];
    Quitbtn.tag=11;
    [Quitbtn addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:Quitbtn];
    self.navigationItem.rightBarButtonItem=item;
    
    
    
}



-(void)creatUI{
    
    
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    
   imageView.image=[UIImage imageNamed:@"zhuanti_bg"];
    
    
    [self.view addSubview:imageView];
    
    
    _button=[[ZKLDZButton alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    
    [_button setImage:[UIImage imageNamed:@"user_u"] forState:UIControlStateNormal];
    [_button setTitle:@"立即登录" forState:UIControlStateNormal];
    if (self.ison==YES) {
        [_button setImage:[UIImage imageNamed:@"user_d"] forState:UIControlStateNormal];
        [_button setTitle:self.string forState:UIControlStateNormal];
        
    }
    
    [_button.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.center=CGPointMake(self.view.center.x, 200);
    [_button addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    _button.tag=10;
    [self.view addSubview:_button];
    
}

-(void)onclick:(UIButton *)button{
    
    if (button.tag==10) {
        
        ZKLZhuceViewController *zhuce=[[ZKLZhuceViewController alloc]init];
        self.navigationController.navigationBarHidden=YES;
        zhuce.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:zhuce animated:YES];
        
        
    }else{
        
        self.ison=NO;
        [_button setTitle:@"立即登录" forState:UIControlStateNormal];
         [_button setImage:[UIImage imageNamed:@"user_u"] forState:UIControlStateNormal];
    }
    
    
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
