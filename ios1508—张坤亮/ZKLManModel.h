//
//  ZKLManModel.h
//  ios1508—张坤亮
//
//  Created by 千锋 on 16/3/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKLManModel : NSObject

@property(nonatomic, copy) NSString * author_name;


@property(nonatomic, strong) NSData * autorIcon_data;


@property(nonatomic, strong) NSData * image_data;


@property(nonatomic, copy) NSString * title;


- (instancetype)initWithDict:(NSDictionary *)dict;


@end
