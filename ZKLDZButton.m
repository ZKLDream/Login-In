//
//  ZKLDZButton.m
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLDZButton.h"

@implementation ZKLDZButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    
    return CGRectMake(0, contentRect.size.height/4.0f * 3, contentRect.size.width, contentRect.size.height/4.0f);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height/4.0f * 3);
}

@end
