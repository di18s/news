//
//  ViewController.m
//  news_HolmogorovDmitry_l3
//
//  Created by Дмитрий on 23/03/2019.
//  Copyright © 2019 Dmitry. All rights reserved.
//

#import "NewsTitleViewController.h"
#import "NewsDescriptionViewController.h"
#import "NewsCollectionViewCell.h"
#import "News.h"

@interface NewsTitleViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) NSArray* newsArray;
@end

@implementation NewsTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.magentaColor];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[NewsCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.collectionView setBackgroundColor:UIColor.whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;

    
    [self.view addSubview:self.collectionView];
    
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    NewsCollectionViewCell* cell = [[NewsCollectionViewCell alloc] init];
    NewsCollectionViewCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    if (!cell){
        cell = [[NewsCollectionViewCell alloc] init];
    }
    

    cell.backgroundColor = UIColor.lightGrayColor;
    cell.imageNews.image = [UIImage imageNamed:@"imageNews"];
    cell.titleNews.text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent aliquam, justo convallis luctus rutrum, erat nulla fermentum diam, at nonummy quam ante ac quam.";
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.bounds.size.width, 150);
}




@end
