//
//  ZKLCollectionViewCell.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLCollectionViewCell.h"

@implementation ZKLCollectionViewCell

{
    
  
    
    UIImageView * _coverImageView;
    
    UILabel * _titleLable;
    
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _coverImageView=[[UIImageView alloc]init];
        [self.contentView addSubview:_coverImageView];
        
        _titleLable=[[UILabel alloc]init];
        
        [self.contentView addSubview:_titleLable];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    CGFloat titleH = 20;
    CGFloat titleX = 0;
    CGFloat titleY = self.frame.size.height-titleH;
    CGFloat titleW = self.frame.size.width;
    
    
    _titleLable.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = self.frame.size.height;
    
    _coverImageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    self.layer.masksToBounds=YES;
    self.layer.cornerRadius=10;
    
    

}

-(void)setModel:(ZKLManModel *)model{
    
    _model=model;
    
    _coverImageView.image=[UIImage imageWithData:model.image_data];
    _titleLable.text=model.title;
    [_titleLable setTextAlignment:NSTextAlignmentCenter];
    [_titleLable setTextColor:[UIColor colorWithRed:242/255.0f green:150/255.0f blue:-0/255.0f alpha:1]];
    
    
}

@end
