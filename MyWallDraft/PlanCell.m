//
//  TestCell.m
//  MyWallDraft
//
//  Created by Jialiang Xiang on 2015-06-26.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "PlanCell.h"

@implementation PlanCell {
    UILabel* textLabel;
}

- (id) initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }
    
    self.backgroundColor = [UIColor whiteColor];
    
    textLabel = [[UILabel alloc]initWithFrame:self.bounds];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.contentView addSubview:textLabel];
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.text = @"";
}

- (void)setText:(NSString *)text
{
    _text = [text copy];
    textLabel.text = self.text;
}

@end