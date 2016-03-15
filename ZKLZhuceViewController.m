//
//  ZKLZhuceViewController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLZhuceViewController.h"
#import "ZKLRegesterViewController.h"
#import "ZKLUsersViewController.h"

@interface ZKLZhuceViewController ()<UIAlertViewDelegate>

{
    
    UITextField * _userTextFiled;
    UITextField * _passwordTextFiled;
}
@end

@implementation ZKLZhuceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    
}


-(void)creatUI{
    
    

    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"22_10.jpg"];
    [self.view addSubview:imageView];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(30, 150, 50, 30)];
    lable.text=@"账号:";
    lable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lable];
    
    UILabel *lable1=[[UILabel alloc]initWithFrame:CGRectMake(30, 220, 50, 30)];
    lable1.text=@"密码:";
    lable1.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lable1];
    
    _userTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(80, 150, 250, 30)];
    
    
    _userTextFiled.borderStyle =  UITextBorderStyleRoundedRect;
    _userTextFiled.placeholder = @"请输入账号";
    [_userTextFiled setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_userTextFiled];
    
    _passwordTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(80, 220, 250, 30)];
   
    _passwordTextFiled.borderStyle =UITextBorderStyleRoundedRect;
    _passwordTextFiled.placeholder = @"请输入密码";
    [_passwordTextFiled setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_passwordTextFiled];
    
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(30, 450, 40, 40)];
     [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.tag = 100;
    
    //2.注册按钮
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-70, 450, 40, 40)];
    [button2 setTitle:@"注册" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:button2];
    button2.tag = 200;
    
    //3.登录按钮
    UIButton *button3=[[UIButton alloc]initWithFrame:CGRectMake(30, 350, self.view.frame.size.width-60, 40)];
    [button3 setTitle:@"登录" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor redColor]];
    [button3.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [button3.titleLabel setTextAlignment:NSTextAlignmentCenter];
    button3.tag=300;
    
    [button3 addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
}

- (void)onClicked:(UIButton *)button{
    
    if (button.tag == 300){
        
        //登陆按钮被点击
        //1.通过账号输入框的值作为key到Userdefults中去取密码值
        NSString * password = [[NSUserDefaults standardUserDefaults] objectForKey:_userTextFiled.text];
        
        //2.判断出去的正确密码，和密码输入框中的密码是否一致
        if ([_passwordTextFiled.text isEqualToString:password]) {
            
            NSLog(@"登陆成功");
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"登录成功" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            //2.显示在界面上
            [alertView show];
            
            ZKLUsersViewController *user=[[ZKLUsersViewController alloc]init];
            user.ison=YES;
            user.string=_userTextFiled.text;
            self.navigationController.navigationBarHidden=NO;
            self.tabBarController.tabBar.hidden=NO;
            [self.navigationController pushViewController:user animated:YES];
            
            
            
            
            
    
            //3.更新当前账号
            [[NSUserDefaults standardUserDefaults] setObject:_userTextFiled.text forKey:@"currentUser"];
            
        }else{
            
            NSLog(@"密码错误或者账号不存在");
        }
        
        
    }else if (button.tag==200){
        
        //注册按钮被点击
       ZKLRegesterViewController * registerController = [[ZKLRegesterViewController alloc] init];
        
        
        [self.navigationController pushViewController:registerController animated:YES];
        
        
    }else if(button.tag==100){
        
        self.navigationController.navigationBarHidden=NO;
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSLog(@"hha");
}



- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
   
    _userTextFiled.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"];
    
    
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
