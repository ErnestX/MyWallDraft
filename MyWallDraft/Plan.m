//
//  Plan.m
//  MyWallDraft
//
//  Created by Jialiang Xiang on 2015-06-29.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "Plan.h"

@implementation Plan

- (id)init
{
    self = [super init];
    if (self) {
        self.timeStamp = [NSDate date];
        NSURL* p = [[NSBundle mainBundle]URLForResource:@"thumbnailPlaceHolder" withExtension:@"jpg"];
        self.thumbnail = [UIImage imageWithData:[NSData dataWithContentsOfURL:p]];
        self.layers = [NSMutableArray array];
    }
    
    return self;
}

@end
