//
//  NewsDescriptionViewController.m
//  news_HolmogorovDmitry_l3
//
//  Created by Дмитрий on 23/03/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

#import "NewsDescriptionViewController.h"
#import "NewsTitleViewController.h"
#import "News.h"


@interface NewsDescriptionViewController ()
@property (nonatomic, strong) UILabel* title_News;
@property (nonatomic, strong) UIImageView* image_News;
@property (nonatomic, strong) UITextView* desc_news;

@end

@implementation NewsDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
}

-(void)addUI{
    _title_News = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    _image_News = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 300)];
    _desc_news = [[UITextView alloc] initWithFrame:CGRectMake(0, 400, self.view.bounds.size.width, 1000)];
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
