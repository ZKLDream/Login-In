//
//  ZKLManTableViewCell.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLManTableViewCell.h"
#import "ZKLButton.h"

@implementation ZKLManTableViewCell
{
    
        UIView * _bgView;
        
        UIImageView * _coverImageView;
        
        UIButton * _iconButton;
        
        UILabel * _authorLabel;
        
        UILabel * _titleLable;
      ZKLButton * _zanButton;
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
      
        _bgView = [[UIView alloc] init];
        
      
        [self.contentView addSubview:_bgView];
        
        //设置边框
        //        _bgView.layer.borderColor = [UIColor whiteColor].CGColor;
        //        _bgView.layer.borderWidth = 1;
        //设置背景视图的背景颜色
        _bgView.backgroundColor = [UIColor whiteColor];
        
       
        _coverImageView = [[UIImageView alloc] init];
        [_bgView addSubview:_coverImageView];
        
        
        _iconButton = [[UIButton alloc] init];
        [_bgView addSubview:_iconButton];
        
      
        _authorLabel = [[UILabel alloc] init];
        [_bgView addSubview:_authorLabel];
        
        [_authorLabel setTextAlignment:NSTextAlignmentCenter];
      
        _authorLabel.textColor = [UIColor lightGrayColor];
        _authorLabel.font = [UIFont systemFontOfSize:12];
        
        
      
        _titleLable = [[UILabel alloc] init];
        [_bgView addSubview:_titleLable];
    
        _titleLable.textAlignment = NSTextAlignmentLeft;
        
        _titleLable.textColor = [UIColor grayColor];
        _titleLable.font = [UIFont systemFontOfSize:15];
        
        _zanButton=[[ZKLButton alloc]init];
        _zanButton.isZan=NO;
        [_zanButton setImage:[[UIImage imageNamed:@"zanzhuanti@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_zanButton setImage:[[UIImage imageNamed:@"zanguo"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
        [_zanButton setTitle:@"0" forState:UIControlStateNormal];
        [_zanButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_zanButton.titleLabel setTextAlignment:NSTextAlignmentRight];
        [_zanButton setTitle:@"1" forState:UIControlStateSelected];
        [_bgView addSubview:_zanButton];
        
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    return self;
    
}

- (void)layoutSubviews{
    
    CGFloat margin = 8;
    //底部高度
    CGFloat bottomH = 40;
    
    //1.========背景视图=========
    CGFloat bgViewX = 0;
    CGFloat bgViewY = -8;
    CGFloat bgViewW = self.frame.size.width ;
    CGFloat bgViewH = self.frame.size.height - margin;
    
    _bgView.frame = CGRectMake(bgViewX, bgViewY, bgViewW, bgViewH);
     //2.封面
    CGFloat coverX = margin;
    CGFloat coverY = bottomH;
    CGFloat coverW = bgViewW-margin*2;
    CGFloat coverH = bgViewH - bottomH*2;
    _coverImageView.frame = CGRectMake(coverX, coverY, coverW, coverH);
    
    //3.==========头像==========
    CGFloat iconX = 20;
    CGFloat iconH = bgViewW * 0.1;
    CGFloat iconY = coverH - iconH * (1/2.0f)+bottomH;
    CGFloat iconW = iconH;
    _iconButton.frame = CGRectMake(iconX, iconY, iconW, iconH);
    //切圆角
    _iconButton.layer.masksToBounds = YES;
    _iconButton.layer.cornerRadius = iconH / 2.0f;
    
    
    //4.作者名
    CGFloat authorW = iconW;
    CGFloat authorCenterX = _iconButton.center.x+iconW/2.0f+authorW/2.0f+10;
    CGFloat authorH = bottomH - iconH / 4.0f;
    CGFloat authorCenterY = bgViewH -bottomH+20;
    
    _authorLabel.frame = CGRectMake(0, 0, authorW, authorH);
    _authorLabel.center = CGPointMake(authorCenterX, authorCenterY);
    //5.标题
    CGFloat titleW = bgViewW-margin;
    CGFloat titleX = margin;
    CGFloat titleY = 0;
    CGFloat titleH = bottomH;
    _titleLable.frame = CGRectMake(titleX, titleY, titleW, titleH);
    //6.button
    
    CGFloat buttonW = bgViewW / 2.0f;
    CGFloat buttonX = bgViewW -150;
    CGFloat buttonY = coverH+bottomH;
    CGFloat buttonH = bottomH;
    _zanButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    [super layoutSubviews];
}











- (void)setModel:(ZKLManModel *)model{
   
    _model = model;
    
   
    _coverImageView.image = [UIImage imageWithData:model.image_data];
    
    [_iconButton setImage:[UIImage imageWithData:model.autorIcon_data] forState:UIControlStateNormal];
    
    _authorLabel.text = model.author_name;
    
    _titleLable.text = [NSString stringWithFormat:@"<<%@>>",model.title];
    
}


- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
