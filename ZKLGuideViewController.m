//
//  ZKLGuideViewController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLGuideViewController.h"
#import "ZKLTabBarController.h"

@interface ZKLGuideViewController ()
{
    NSTimer * _timer;
    NSMutableArray *_images;
    UIImageView *_imageView;
}

@end

@implementation ZKLGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    
}

-(void)creatUI{
    
    _images=[[NSMutableArray alloc]init];
    for (int i=0; i<15; i++) {
        UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"46_%d.jpg",i+1]];
        [_images addObject:image];
    }
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    _imageView.image=_images[0];
    [self.view addSubview:_imageView];
    [_imageView setAnimationDuration:10];
    [_imageView setAnimationImages:_images];
    
    [_imageView setAnimationRepeatCount:0];
    
    [_imageView startAnimating];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(300, 500, 60, 60)];
    [button setTitle:@"跳过" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(onclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
 //   _timer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(game) userInfo:nil repeats:YES];
   
}






-(void)onclicked{
    
    
    
    ZKLTabBarController *tabBarcontroller=[[ZKLTabBarController alloc]init];
    
    
    self.view.window.rootViewController=tabBarcontroller;
    
    
    
    
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
