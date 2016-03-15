//
//  ZKLRegesterViewController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLRegesterViewController.h"

@interface ZKLRegesterViewController ()<UIAlertViewDelegate>

{
    
    
        
        UITextField * _userTextFiled;
        UITextField * _passwordTextFiled;
     UITextField * _password1TextFiled;
}
@end

@implementation ZKLRegesterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
}

-(void)creatUI{
    
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"22_10.jpg"];
    [self.view addSubview:imageView];
    
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(30, 100, 50, 30)];
    lable.text=@"账号:";
    lable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lable];
    
    UILabel *lable1=[[UILabel alloc]initWithFrame:CGRectMake(30, 170, 50, 30)];
    lable1.text=@"密码:";
    lable1.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lable1];
    
    
    UILabel *lable2=[[UILabel alloc]initWithFrame:CGRectMake(30, 240, 50, 30)];
    lable2.text=@"密码:";
    lable2.backgroundColor=[UIColor clearColor];
    [self.view addSubview:lable2];
    
    
    //创建两个文本输入框
    _userTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(80,100, 250, 30)];
   
    _userTextFiled.borderStyle =  UITextBorderStyleRoundedRect;
    _userTextFiled.placeholder = @"请输入账号";
    [_userTextFiled setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_userTextFiled];
    
    _passwordTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(80, 170, 250, 30)];
    
    _passwordTextFiled.borderStyle =UITextBorderStyleRoundedRect;
    _passwordTextFiled.placeholder = @"请输入密码";
     [_passwordTextFiled setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_passwordTextFiled];
    
    _password1TextFiled = [[UITextField alloc] initWithFrame:CGRectMake(80, 240, 250, 30)];
    
    _password1TextFiled.borderStyle =UITextBorderStyleRoundedRect;
    _password1TextFiled.placeholder = @"请输入密码";
     [_password1TextFiled setBackgroundColor:[UIColor clearColor]];
     [self.view addSubview:_password1TextFiled];
    
    //创建两个按钮
    //1.登陆按钮
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(30, 350, 40, 40)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.tag = 100;
    
    //2.注册按钮
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-70, 350, 40, 40)];
    [button2 setTitle:@"确定" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:button2];
    button2.tag = 200;
    
    
    
}


- (void)onClicked:(UIButton *)button{
    
    if (button.tag == 100){
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        
       
        if (_userTextFiled.text.length != 0 && _passwordTextFiled.text.length != 0) {
            if (_passwordTextFiled.text.length != 0&&[_passwordTextFiled.text isEqualToString:_password1TextFiled.text]) {
                NSLog(@"注册成功");
                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"注册成功" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                //2.显示在界面上
                [alertView show];
                //1.以当前注册成功的账号值为key，以当前的密码为值存到UserDefults中
                [[NSUserDefaults standardUserDefaults] setObject:_passwordTextFiled.text forKey:_userTextFiled.text];
                //2.以当前注册成功的账号为值，以一个固定的字符串为key，保存当前的账号
                [[NSUserDefaults standardUserDefaults] setObject:_userTextFiled.text forKey:@"currentUser"];
                
                
                //返回上一页
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                NSLog(@"密码不一致");
            }
            
        }else{
            
            NSLog(@"账号或者密码为空");
        }
        
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        
        NSLog(@"取消");
        
    }else{
        
        NSLog(@"确定");
    }
    
    NSLog(@"%ld", buttonIndex);
    
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
