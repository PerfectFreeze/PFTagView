//
//  PFTagViewConfiguration.m
//  PFTagView
//
//  Created by Cee on 10/08/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "PFTagViewConfiguration.h"

@implementation PFTagViewConfiguration

- (instancetype)init {
    self = [super init];
    if (self) {
        // Default values
        self.maxFontSize = 48.f;
        self.minFontSize = 16.f;
        self.tagViewBackgroundColor = [UIColor clearColor];
        self.tagViewMainTextColor = [UIColor blackColor];
        self.tagViewCountLabelTextColor = [UIColor blackColor];
        self.tagViewCountLabelFontSize = 10.f;
        self.tagViewHeight = 50.f;
        self.tagViewMargin = 5.f;
    }
    return self;
}

@end
