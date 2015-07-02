//
//  TweetsViewController.m
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import "TweetListViewController.h"
#import "User_NOUSE.h"
#import "TwitterClient.h"
#import "Tweet_NOUSE.h"
#import "TweetListDataStore.h"
#import "TweetListCollectionViewCell.h"
#import "AccountManager.h"
#import "TweetDetailViewController.h"
#import "TweetNewPostViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "OperationDelegate.h"
#import <UIScrollView+InfiniteScroll.h>

@interface TweetListViewController () <OperationDelegate>
@property (strong, nonatomic) TweetListDataStore *tweetListDataStore;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end

@implementation TweetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetListDataStore = [[TweetListDataStore alloc]init];
    [self setupView];
    [self.tweetListDataStore loadNextBunchWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        
    }];
    
    [[TwitterClient sharedInstance] getHomeTimelineWithParams:nil completion:^(TweetList *tweetList, NSError *error) {
        NSLog(@"fir:%@", tweetList);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLogout:(id)sender {
    [AccountManager logout];
}


- (void)setupView
{
    [super setupView];
  
    //set collection view
    //self.favoriteSellerDataStore = [[FavoriteSellerDataStore alloc] init];
    UINib *tweetListCollectionViewCellNib = [UINib nibWithNibName:@"TweetListCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:tweetListCollectionViewCellNib forCellWithReuseIdentifier:@"TweetListCollectionViewCell"];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    //set up tap bar item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(tapNewPostButton)];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    //    refreshControl.addTarget(self, action: "fetchStories", forControlEvents: UIControlEvents.ValueChanged)
    [self.refreshControl addTarget:self action:@selector(refreshList) forControlEvents:UIControlEventValueChanged];
       [self.collectionView addSubview:self.refreshControl];
    
       //infinte scorlling
        __weak typeof(self) weakSelf = self;
        
        [self.collectionView addInfiniteScrollWithHandler:^(UICollectionView* collectionView) {
            
            [self.tweetListDataStore loadNextBunchWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
                     [self.collectionView finishInfiniteScroll];
                [self.collectionView reloadData];
                //[self.collectionView finishInfiniteScroll];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
                
            }];
        }];
    
}
- (void)tapNewPostButton
{
    TweetNewPostViewController *tweetNewPostViewController = [[TweetNewPostViewController alloc] init];
    //tweetDetailViewController.tweet = tweet;
    [self.navigationController pushViewController:tweetNewPostViewController animated:YES];
    
}

#pragma mark pull to refresh
-(void) refreshList {
    [self.tweetListDataStore reloadWithCleanUp:^ (AFHTTPRequestOperation *operation, id response) {
        [self.collectionView reloadData];
        [self.refreshControl endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        
    }];
}


#pragma mark - UICollectionViewDelegate Method

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.tweetListDataStore.totalCount;
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TweetListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TweetListCollectionViewCell" forIndexPath:indexPath];
    Tweet *tweet = self.tweetListDataStore.data[indexPath.row];
    cell.userNameLabel.text = tweet.user.name;
    cell.tweetLabel.text = tweet.text;
    cell.tweet = tweet;
    cell.delegate = self;
    NSURL *imageURL = [[NSURL alloc] initWithString:tweet.user.profileImageUrl];
    [cell.userProfileImageView sd_setImageWithURL:imageURL placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!error) {
            cell.userProfileImageView.image = image;
        }
    }];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[NibSizeCalculator sharedInstance] sizeForNibNamed:@"TweetListCollectionViewCell" withstyle:NibFixedHeightScaling];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Tweet *tweet = (Tweet *)self.tweetListDataStore.data[indexPath.row];
    TweetDetailViewController *tweetDetailViewController = [[TweetDetailViewController alloc] init];
    tweetDetailViewController.tweet = tweet;
    [self.navigationController pushViewController:tweetDetailViewController animated:YES];
}

#pragma mark - OperateionDelegate
- (void)tapReplyDelegate:(id)sender tweet:(Tweet *)tweet
{
    NSLog(@"tapReplyDelegate");
}
- (void)tapRetweetDelegate:(id)sender tweet:(Tweet *)tweet
{
    
    NSLog(@"tapRetweetDelegate");
    
}
- (void)tapFavoriteDelegate:(id)sender tweet:(Tweet *)tweet
{
    NSLog(@"tweet::%@", tweet);
    NSLog(@"tapFavoriteDelegate");
    [[TwitterClient sharedInstance] addFavourite:tweet.tweetId completion:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"succss add");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        NSLog(@"fail add:%@", err);
    }];
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
