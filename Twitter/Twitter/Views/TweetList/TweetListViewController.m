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
@interface TweetListViewController ()
@property (strong, nonatomic) TweetListDataStore *tweetListDataStore;
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
    
//    [[TwitterClient sharedInstance] getHomeTimelineWithParams:nil completionV1:^(NSArray *tweets, NSError *error) {
//        for (Tweet_NOUSE *tweet in tweets) {
//            NSLog(@"tweet::%@", tweet.text);
//        }
//    }];
//    [[TwitterClient sharedInstance] getHomeTimelineWithParams:nil completion:^(TweetList *tweetList, NSError *error) {
//        for (Tweet *tweet in tweetList.tweets) {
//            NSLog(@"tweet::%@", tweet.tweetId);
//        }
//    }];
//    TweetListDataStore *tweetListDataStore = [[TweetListDataStore alloc]init];
//    [tweetListDataStore loadNextBunchWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
//        NSLog(@"data::%@", tweetListDataStore.data);
//        NSLog(@"count::%ld", (long)tweetListDataStore.totalCount);
//        [tweetListDataStore loadNextBunchWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
//            NSLog(@"data::%@", tweetListDataStore.data);
//            NSLog(@"count::%ld", (long)tweetListDataStore.totalCount);
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
//            NSLog(@"erorr:::%@", err);
//        }];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
//        NSLog(@"erorr:::%@", err);
//    }];
    // Do any additional setup after loading the view from its nib.
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
    //set collection view
    //self.favoriteSellerDataStore = [[FavoriteSellerDataStore alloc] init];
    UINib *tweetListCollectionViewCellNib = [UINib nibWithNibName:@"TweetListCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:tweetListCollectionViewCellNib forCellWithReuseIdentifier:@"TweetListCollectionViewCell"];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
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
    
    //EASeller *seller = (EASeller *)[self.favoriteSellerDataStore.data objectAtIndex:indexPath.row];
    //cell.delegate = self;
    
//    cell.sellerStoreNameLabel.text = seller.storeName;
//    cell.ratingLabel.text =  seller.ratingInfo.total;
//    cell.sellerStoreNameLabel.text = seller.storeName;
//    cell.ratingLabel.text = [NSString stringWithFormat:@"評價 %@", seller.rating]; //TRANSLATE
//    
//    cell.inFavoriteSellerButton.selected = [self.removedFavoriteSellerEcids containsObject:seller.ecid];//not in
//    cell.sellerAvatarView.contentMode = UIViewContentModeCenter;
//    
//    [cell.sellerAvatarView setAvatarImageWithURL:[NSURL URLWithString:seller.logoUrl]
//                                placeholderImage:[UIImage imageNamed:@"Img-DefaultAvatar"]
//                                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                                           if (!error) {
//                                               cell.sellerAvatarView.image = image;
//                                               cell.sellerAvatarView.contentMode = UIViewContentModeScaleAspectFill;
//                                           }
//                                       }
//     ];
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
