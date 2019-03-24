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
#import <YYWebImage/YYWebImage.h>
#define News_Image(iata) [NSURL URLWithString:[NSString stringWithFormat:@"https://pics.avs.io/200/200/%@.png", iata]];


@interface NewsDescriptionViewController ()
@property (nonatomic, strong) UILabel* title_News;
@property (nonatomic, strong) UIImageView* image_News;
@property (nonatomic, strong) UITextView* desc_news;

@end

@implementation NewsDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.whiteColor];
    [self addUI];
}

-(void)addUI{
    _title_News = [[UILabel alloc] initWithFrame:CGRectMake(5, 80, self.view.bounds.size.width - 5, 100)];
    self.title_News.numberOfLines = 7;
    [self.title_News setContentScaleFactor:2];
    [self.title_News setText:self.title_News_ST];
    [self.view addSubview:_title_News];
    
    _image_News = [[UIImageView alloc] initWithFrame:CGRectMake(0, 180, self.view.bounds.size.width, 300)];
    NSURL *url = News_Image(self.image_News_ST);
    [self.image_News yy_setImageWithURL:url options:YYWebImageOptionSetImageWithFadeAnimation];
    [self.view addSubview:_image_News];
    
    _desc_news = [[UITextView alloc] initWithFrame:CGRectMake(0, 420, self.view.bounds.size.width, 1000)];
    self.desc_news.text = self.desc_news_ST;
    [self.view addSubview:_desc_news];
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
