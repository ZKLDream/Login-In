//
//  ZKLDrawViewController.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLDrawViewController.h"
#import "ZKLCollectionViewCell.h"
#import "ZKLManModel.h"


@interface ZKLDrawViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView * _collectionView;
    
}
@property(nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation ZKLDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"绘本";
    [self.navigationItem setTitle:@"绘本"];
    [self creatCollectionView];
    
}

- (NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        
      
        _dataArray = [[NSMutableArray alloc] init];
  
        
      
        NSString * path = [[NSBundle mainBundle] pathForResource:@"data2.plist" ofType:nil];
        
        NSArray * plistArray = [NSArray arrayWithContentsOfFile:path];
        
       
        for (NSDictionary * dict in plistArray) {
            
            ZKLManModel * model = [[ZKLManModel alloc] initWithDict:dict];
            
           
            [_dataArray addObject:model];
        }
    }
    
    return _dataArray;
}

-(void)creatCollectionView{
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
 //   flowLayout.itemSize = CGSizeMake(150, 200);
    
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor=[UIColor lightGrayColor];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[ZKLCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    //6.注册复用View
    //注册headerView
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view"];
    //注册footerView
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //1.去复用队列中，带着复用ID去找可以复用的cell；
   ZKLCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //如果在复用队列中没有找到可以复用的cell，不需要程序员自己去创建一个新的cell。collectionView会自动帮你创建。前提：要在collectionView中注册cell,告诉collectionView你需要它帮你创建的cell的类型和cell复用ID。
    
    
  
 //  cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:1];
    ZKLManModel * model = self.dataArray[indexPath.row];
     cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:1];
    //给model赋值的时候会调用model的set方法
    cell.model = model;
    
    //3.返回cell
    return cell;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

#pragma mark -header颜色
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    //===========设置footerView===============
    if (kind == UICollectionElementKindSectionFooter) {
        
        UICollectionReusableView * footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        
        footerView.backgroundColor = [UIColor colorWithRed:189/255.0f green:159/255.0f blue:-0/255.0f alpha:1];
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(13, 0, self.view.frame.size.width-13, 40)];
        lable.text=@"精彩继续";
        [lable setFont:[UIFont systemFontOfSize:20]];
        [footerView addSubview:lable];

        return footerView;
        
        
    }
    

    //==============设置headerView==============
    //去复用队列中去可以复用的view,如果找到可以复用view,系统会自动创建一个新的view
    //参数1:复用的view的作用（是作为footerView还是作为headerView）
    //    UICollectionElementKindSectionFooter   footer
    //    UICollectionElementKindSectionHeader   header
    
    //参数2:复用ID
    //参数3:当前位置
    UICollectionReusableView * reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view" forIndexPath:indexPath];
    
    reusableView.backgroundColor = [UIColor colorWithRed:189/255.0f green:159/255.0f blue:-0/255.0f alpha:1];
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(13, 0, self.view.frame.size.width-13, 40)];
    lable.text=@"最近更新";
    [lable setFont:[UIFont systemFontOfSize:20]];
    [reusableView addSubview:lable];
    return reusableView;
    
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"第%ld组，第%ld个cell被选中",indexPath.section, indexPath.item);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width-3*10)/2.0f, 200);
    
}
    



- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    //需求1：一行显示4个cell,每个cell之间的间距是10，cell到屏幕之间的间距也是10
    //    return UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    //需求2：知道一行显示4个cell,每个cell的宽度是70，间距不固定（间距都一样）
    //    CGFloat margin = (_collectionView.frame.size.width - 4 * 70)/5.0f;
    //    return UIEdgeInsetsMake(20, margin, 20, margin);
    
    
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(self.view.frame.size.width, 40);
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    return CGSizeMake(self.view.frame.size.width, 40);
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [NSString stringWithFormat:@"最近更新"];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    return [NSString stringWithFormat:@"精彩继续"];
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
