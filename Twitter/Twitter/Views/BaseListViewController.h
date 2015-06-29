//
//  BaseListViewController.h
//  Twitter
//
//  Created by Anson Ng on 6/28/15.
//  Copyright (c) 2015 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface BaseListViewController : BaseViewController  <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end