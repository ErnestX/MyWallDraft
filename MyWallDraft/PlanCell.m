//
//  TestCell.m
//  MyWallDraft
//
//  Created by Jialiang Xiang on 2015-06-26.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "PlanCell.h"
#import "Plan.h"
#define TIMESTAMP_HEIGHT 30.0

@implementation PlanCell {
    UILabel* timeLabel;
    Plan* plan;
    UIImageView* thumbnailView;
}

- (id) initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }
    
    plan = [[Plan alloc]init];
    thumbnailView = [[UIImageView alloc]initWithImage:plan.thumbnail];
    thumbnailView.contentMode = UIViewContentModeScaleAspectFill;
    self.contentView.clipsToBounds = YES;
    thumbnailView.frame = CGRectMake(0.0, 0.0, self.contentView.frame.size.width, self.contentView.frame.size.height - TIMESTAMP_HEIGHT);
    [self.contentView addSubview:thumbnailView];
    
    timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, self.contentView.frame.size.height - TIMESTAMP_HEIGHT, self.contentView.frame.size.width, TIMESTAMP_HEIGHT)];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:timeLabel];
    
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
    timeLabel.text = self.text;
}

- (void)updateLayout
{
    NSLog(@"update layout");
    thumbnailView.frame = CGRectMake(0.0, 0.0, self.contentView.frame.size.width, self.contentView.frame.size.height - TIMESTAMP_HEIGHT);
    timeLabel.frame = CGRectMake(0.0, self.contentView.frame.size.height - TIMESTAMP_HEIGHT, self.contentView.frame.size.width, TIMESTAMP_HEIGHT);
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self updateLayout];
}

@end
