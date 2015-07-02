//
//  TestCell.h
//  MyWallDraft
//
//  Created by Jialiang Xiang on 2015-06-26.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlanCell : UICollectionViewCell

@property (nonatomic, copy) NSString* text;

- (void)updateLayout;

@end
