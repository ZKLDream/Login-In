//
//  ZKLManViewController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLManViewController.h"
#import  "ZKLManModel.h"
#import "ZKLManTableViewCell.h"
#import "NextViewController.h"

@interface ZKLManViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
}

@property(nonatomic, strong) NSMutableArray * dataArray;

@end



@implementation ZKLManViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
}

-(void)creatTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //2.设置代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    //3.添加到界面上
    [self.view addSubview:_tableView];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建下一个界面的对象
    NextViewController *next=[[NextViewController alloc]init];
    //拿到被选中的cell 对应的数据  //将数据传给下一个界面
   ZKLManModel *model=self.dataArray[indexPath.row];
    next.model=model;
    [self.navigationController pushViewController:next animated:YES];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"cellId";
    
    //1.去复用队列中找可以复用的cell
    ZKLManTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    //2.判断是否找到可以复用的cell,如果没有找到就创建一个新的cell
    if (cell == nil) {
        
        cell = [[ZKLManTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //3.刷新数据
    ZKLManModel * model = self.dataArray[indexPath.row];
    
    //给model赋值的时候会调用model的set方法
    cell.model = model;
    
    //将图片的二进制数据转换成图片
    //+ (UIImage *)imageWithData:(NSData *)data;
    //    cell.imageView.image = [UIImage imageWithData:model.image_data];
    //    cell.textLabel.text = model.title;
    
    //4.返回cell
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 300;
}


- (NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        
        _dataArray = [[NSMutableArray alloc] init];
        
        //如果想要创建这个对象的时候，再做一些事情，那么就写到这儿。。。
        //========获取数据=========
        //1.拿到plist文件路径
        NSString * path = [[NSBundle mainBundle] pathForResource:@"data2.plist" ofType:nil];
        
        //2.取出plist文件里面的数据
        NSArray * plistArray = [[NSArray alloc] initWithContentsOfFile:path];
        
        //3.遍历出数组中的字典
        for (NSDictionary * dict in plistArray) {
            
            //4.取出字典里面的数据，存到模型中
            //            ManManModel * model = [[ManManModel alloc] init];
            ZKLManModel * model = [[ZKLManModel alloc] initWithDict:dict];
            
            //5.将模型存到数据源数组中
            [_dataArray addObject:model];
            
        }
        
        
        
    }
    
    return _dataArray;
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
