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
#define NewsImage(iata) [NSURL URLWithString:[NSString stringWithFormat:@"https://pics.avs.io/200/200/%@.png", iata]];

@interface NewsTitleViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray* newsArray;
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation NewsTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.magentaColor];
    
    _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 150;
    [_tableView setBackgroundColor:UIColor.whiteColor];
    [self.view addSubview:_tableView];
    
    [self load:@"https://newsapi.org/v2/top-headlines?country=ru&apiKey=07967613987b407298c77142b50151f9" withCompletion:^(id  _Nullable result) {
        NSDictionary* json = result;
        self.newsArray = [NSMutableArray new];
        NSInteger num = 0;

        for (NSObject *i in [json valueForKey:@"articles"]){
            //NSURL *urlLogo = [i valueForKey:@"urlToImage"];
            News* news = [[News alloc] initWithTitle:[i valueForKey:@"title"] image:[i valueForKey:@"urlToImage"] description:[i valueForKey:@"description"]];
            
            [self.newsArray addObject:news];
            
            NSLog(@"%lu - %@", (unsigned long)self.newsArray.count, [self.newsArray[num] titleNews]);
            num += 1;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell) {
 
        cell = [[NewsTableViewCell alloc] init];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSURL *url = NewsImage([self.newsArray[indexPath.row]imageNews]);
    [cell.imageNews yy_setImageWithURL:url options:YYWebImageOptionSetImageWithFadeAnimation];
    cell.titleNews.text = [self.newsArray[indexPath.row] titleNews];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsDescriptionViewController* vc = [NewsDescriptionViewController new];
    vc.desc_news_ST = [self.newsArray[indexPath.row]descNews];
    vc.title_News_ST = [self.newsArray[indexPath.row]titleNews];
    vc.image_News_ST = [self.newsArray[indexPath.row]imageNews];
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
