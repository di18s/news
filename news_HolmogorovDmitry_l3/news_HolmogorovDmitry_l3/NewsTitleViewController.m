//
//  ViewController.m
//  news_HolmogorovDmitry_l3
//
//  Created by Дмитрий on 23/03/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

#import "NewsTitleViewController.h"
#import "NewsDescriptionViewController.h"
#import "News.h"
#import "NewsTableViewCell.h"
#import <YYWebImage/YYWebImage.h>
#define NewsImage(iata) [NSURL URLWithString: iata];

@interface NewsTitleViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray* businessArray;
@property (nonatomic, strong) NSMutableArray* sportsArray;
@property (nonatomic, strong) NSMutableArray* scienceArray;
@property (nonatomic, strong) NSMutableArray* technologyArray;
@property (nonatomic, strong) NSMutableArray* healthArray;
@property (nonatomic, strong) NSMutableArray* entertainment;

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UISegmentedControl* theme;
@property (nonatomic, strong) NSArray* urlNews;
@end

@implementation NewsTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.magentaColor];
    self.urlNews = @[@"https:newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=07967613987b407298c77142b50151f9",
                     @"https:newsapi.org/v2/top-headlines?country=ru&category=entertainment&apiKey=07967613987b407298c77142b50151f9",
                     @"https:newsapi.org/v2/top-headlines?country=ru&category=sport&apiKey=07967613987b407298c77142b50151f9",
                     @"https:newsapi.org/v2/top-headlines?country=ru&category=science&apiKey=07967613987b407298c77142b50151f9",
                     @"https:newsapi.org/v2/top-headlines?country=ru&category=health&apiKey=07967613987b407298c77142b50151f9",
                     @"https:newsapi.org/v2/top-headlines?country=ru&category=technology&apiKey=07967613987b407298c77142b50151f9"];
    [self themeSelection];
    _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 150;
    [_tableView setBackgroundColor:UIColor.whiteColor];
    [self.view addSubview:_tableView];
    [self loadContent];
}

-(void)themeSelection{
    _theme =[[UISegmentedControl alloc] initWithItems:@[@"Бизнес", @"Развлечения", @"Спорт", @"Наука", @"Здоровье", @"Технологии"]];
    _theme.tintColor = [UIColor blackColor];
    [_theme addTarget:self action:@selector(selectSegment) forControlEvents:UIControlEventValueChanged];
    _theme.selectedSegmentIndex = 5;
    self.navigationItem.titleView = _theme;
}
-(void)selectSegment{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}
-(void)loadContent{
    [self load:self.urlNews[0] withCompletion:^(id _Nullable result) {
        NSDictionary* json = result;
        self.businessArray = [NSMutableArray new];
        for (NSObject *i in [json valueForKey:@"articles"]){
            News* news = [[News alloc] initWithTitle:[i valueForKey:@"title"] image:[i valueForKey:@"urlToImage"] description:[i valueForKey:@"description"]];
            [self.businessArray addObject:news];
        }
    }];
    
    [self load:self.urlNews[1] withCompletion:^(id _Nullable result) {
        NSDictionary* json = result;
        self.entertainment = [NSMutableArray new];
        for (NSObject *i in [json valueForKey:@"articles"]){
            News* news = [[News alloc] initWithTitle:[i valueForKey:@"title"] image:[i valueForKey:@"urlToImage"] description:[i valueForKey:@"description"]];
            [self.entertainment addObject:news];
        }
    }];
    
    [self load:self.urlNews[2] withCompletion:^(id _Nullable result) {
        NSDictionary* json = result;
        self.sportsArray = [NSMutableArray new];
        for (NSObject *i in [json valueForKey:@"articles"]){
            News* news = [[News alloc] initWithTitle:[i valueForKey:@"title"] image:[i valueForKey:@"urlToImage"] description:[i valueForKey:@"description"]];
            [self.sportsArray addObject:news];
        }
    }];
    
    [self load:self.urlNews[3] withCompletion:^(id _Nullable result) {
        NSDictionary* json = result;
        self.scienceArray = [NSMutableArray new];
        for (NSObject *i in [json valueForKey:@"articles"]){
            News* news = [[News alloc] initWithTitle:[i valueForKey:@"title"] image:[i valueForKey:@"urlToImage"] description:[i valueForKey:@"description"]];
            [self.scienceArray addObject:news];
        }
    }];
    
    [self load:self.urlNews[4] withCompletion:^(id _Nullable result) {
        NSDictionary* json = result;
        self.healthArray = [NSMutableArray new];
        for (NSObject *i in [json valueForKey:@"articles"]){
            News* news = [[News alloc] initWithTitle:[i valueForKey:@"title"] image:[i valueForKey:@"urlToImage"] description:[i valueForKey:@"description"]];
            [self.healthArray addObject:news];
        }
    }];
    
    [self load:self.urlNews[5] withCompletion:^(id _Nullable result) {
        NSDictionary* json = result;
        self.technologyArray = [NSMutableArray new];
        for (NSObject *i in [json valueForKey:@"articles"]){
            News* news = [[News alloc] initWithTitle:[i valueForKey:@"title"] image:[i valueForKey:@"urlToImage"] description:[i valueForKey:@"description"]];
            [self.technologyArray addObject:news];
        }
    }];

}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.theme.selectedSegmentIndex) {
        case 0:
            return self.businessArray.count;
            break;
        case 1:
            return self.entertainment.count;
            break;
        case 2:
            return self.sportsArray.count;
            break;
        case 3:
            return self.scienceArray.count;
            break;
        case 4:
            return self.healthArray.count;
            break;
        case 5:
            return self.technologyArray.count;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell) {
 
        cell = [[NewsTableViewCell alloc] init];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    switch (self.theme.selectedSegmentIndex) {
        case 0:
            [cell.imageNews yy_setImageWithURL:[NSURL URLWithString:[self.businessArray[indexPath.row]imageNews]] options:YYWebImageOptionSetImageWithFadeAnimation];
            cell.titleNews.text = [self.businessArray[indexPath.row] titleNews];
            break;
        case 1:
            [cell.imageNews yy_setImageWithURL:[NSURL URLWithString:[self.entertainment[indexPath.row]imageNews]] options:YYWebImageOptionSetImageWithFadeAnimation];
            cell.titleNews.text = [self.entertainment[indexPath.row] titleNews];
            break;
        case 2:
            [cell.imageNews yy_setImageWithURL:[NSURL URLWithString:[self.sportsArray[indexPath.row]imageNews]] options:YYWebImageOptionSetImageWithFadeAnimation];
            cell.titleNews.text = [self.sportsArray[indexPath.row] titleNews];
            break;
        case 3:
            [cell.imageNews yy_setImageWithURL:[NSURL URLWithString:[self.scienceArray[indexPath.row]imageNews]] options:YYWebImageOptionSetImageWithFadeAnimation];
            cell.titleNews.text = [self.scienceArray[indexPath.row] titleNews];
            break;
        case 4:
            [cell.imageNews yy_setImageWithURL:[NSURL URLWithString:[self.healthArray[indexPath.row]imageNews]] options:YYWebImageOptionSetImageWithFadeAnimation];
            cell.titleNews.text = [self.healthArray[indexPath.row] titleNews];
            break;
        case 5:
            [cell.imageNews yy_setImageWithURL:[NSURL URLWithString:[self.technologyArray[indexPath.row]imageNews]] options:YYWebImageOptionSetImageWithFadeAnimation];
            cell.titleNews.text = [self.technologyArray[indexPath.row] titleNews];
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsDescriptionViewController* vc = [NewsDescriptionViewController new];
    switch (self.theme.selectedSegmentIndex) {
        case 0:
            vc.desc_news_ST = [self.businessArray[indexPath.row]descNews];
            vc.title_News_ST = [self.businessArray[indexPath.row]titleNews];
            vc.image_News_ST = [self.businessArray[indexPath.row]imageNews];
            break;
        case 1:
            vc.desc_news_ST = [self.entertainment[indexPath.row]descNews];
            vc.title_News_ST = [self.entertainment[indexPath.row]titleNews];
            vc.image_News_ST = [self.entertainment[indexPath.row]imageNews];
            break;
        case 2:
            vc.desc_news_ST = [self.sportsArray[indexPath.row]descNews];
            vc.title_News_ST = [self.sportsArray[indexPath.row]titleNews];
            vc.image_News_ST = [self.sportsArray[indexPath.row]imageNews];
            break;
        case 3:
            vc.desc_news_ST = [self.scienceArray[indexPath.row]descNews];
            vc.title_News_ST = [self.scienceArray[indexPath.row]titleNews];
            vc.image_News_ST = [self.scienceArray[indexPath.row]imageNews];
            break;
        case 4:
            vc.desc_news_ST = [self.healthArray[indexPath.row]descNews];
            vc.title_News_ST = [self.healthArray[indexPath.row]titleNews];
            vc.image_News_ST = [self.healthArray[indexPath.row]imageNews];
            break;
        case 5:
            vc.desc_news_ST = [self.technologyArray[indexPath.row]descNews];
            vc.title_News_ST = [self.technologyArray[indexPath.row]titleNews];
            vc.image_News_ST = [self.technologyArray[indexPath.row]imageNews];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)load:(NSString*)urlString withCompletion:(void(^)(id _Nullable result))completion{
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionTask* task = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id serialization = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        completion(serialization);
    }];
    [task resume];
}
@end
