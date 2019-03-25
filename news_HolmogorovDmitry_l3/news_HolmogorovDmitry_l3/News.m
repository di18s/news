//
//  News.m
//  news_HolmogorovDmitry_l3
//
//  Created by Дмитрий on 23/03/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

#import "News.h"

@implementation News
-(instancetype)initWithTitle:(NSString *)title image:(NSString *)image description:(NSString *)desc{
    if (self = [super init]){
        _titleNews = title;
        _descNews = desc;
        _imageNews = image;
    
    }
    return self;
}
@end
