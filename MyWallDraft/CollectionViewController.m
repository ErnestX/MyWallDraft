//
//  CollectionViewController.m
//  MyWallDraft
//
//  Created by Jialiang Xiang on 2015-06-25.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "CollectionViewController.h"
#import "PlanCell.h"

static NSString *CellIdentifier = @"Cell Identifier";

@implementation CollectionViewController
{
    NSMutableArray *plansArray;
    NSDateFormatter *dateFormatter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    plansArray = [NSMutableArray array];
    dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"h:mm:ss a" options:0 locale:[NSLocale currentLocale]]];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    flowLayout.minimumInteritemSpacing = 20.0f;
    flowLayout.minimumLineSpacing = 40.0f;
    flowLayout.sectionInset = UIEdgeInsetsMake(40, 40, 40, 40);
    flowLayout.itemSize = CGSizeMake(200, 200);
    
    [self.collectionView registerClass: [PlanCell class] forCellWithReuseIdentifier:CellIdentifier];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(userTappedAddButton:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationItem.title = @"My Wall";
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return plansArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PlanCell *cell = (PlanCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.text = [dateFormatter stringFromDate:plansArray[indexPath.item]];
    
    return cell;
}

- (void)userTappedAddButton:(id)sender
{
    [self addNewDate];
}

- (void)addNewDate
{
    [self.collectionView performBatchUpdates:^ {
        NSDate *newDate = [NSDate date];
        [plansArray insertObject:newDate atIndex:0];
        
        [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
    } completion:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIDeviceOrientationPortrait ||
        orientation == UIDeviceOrientationPortraitUpsideDown) {
        return CGSizeMake(320.0, 250.0);
    } else {
        return CGSizeMake(300.0, 250.0);
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinator> coordinator) {
        [self.collectionView performBatchUpdates:nil completion:nil];
    }completion:nil];
}

@end
