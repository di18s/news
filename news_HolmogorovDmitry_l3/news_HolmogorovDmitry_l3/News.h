//
//  News.h
//  news_HolmogorovDmitry_l3
//
//  Created by Дмитрий on 23/03/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject
@property (nonatomic, strong) NSString* imageNews;
@property (nonatomic, strong) NSString* titleNews;
@property (nonatomic, strong) NSString* descNews;
-(instancetype)initWithTitle:(NSString*)title image:(NSString*)image description:(NSString*)desc;
@end

NS_ASSUME_NONNULL_END
