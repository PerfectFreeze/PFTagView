//
//  PFTagView.m
//  PFTagView
//
//  Created by Cee on 10/08/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "PFTagView.h"

@interface PFTagView ()
@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSArray *counts;
@property (nonatomic, strong) NSMutableArray *views;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) PFTagViewConfiguration *configuration;

@property (nonatomic, assign) CGFloat maxFontSize;
@property (nonatomic, assign) CGFloat minFontSize;
@property (nonatomic, assign) CGFloat maxWidth;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat lineHeight;
@property (nonatomic, assign) CGFloat margin;
@end

@implementation PFTagView

- (id)initWithFrame:(CGRect)frame
               dict:(NSDictionary *)dict
             config:(PFTagViewConfiguration *)configuration {
    self = [super initWithFrame:frame];
    if (self) {
        self.dict = dict;
        self.configuration = configuration;
        self.maxFontSize = self.configuration.maxFontSize;
        self.minFontSize = self.configuration.minFontSize;
        self.margin = self.configuration.tagViewMargin;
        self.scrollView.backgroundColor = self.configuration.tagViewBackgroundColor;
        [self addSubview:self.scrollView];
        [self setup];
    }
    return self;
}

#pragma mark - Lazy load

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.contentSize = CGSizeZero;
        _scrollView.scrollEnabled = YES;
        _scrollView.directionalLockEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (NSMutableArray *)views {
    if (!_views) {
        _views = [NSMutableArray array];
    }
    return _views;
}

#pragma mark - Private Methods

- (void)setup {
    [self removeAllSubviews];
    [self sortDict];

    self.x = 0;
    self.y = 0;
    self.maxWidth = self.frame.size.width - self.margin;
    for (int i = 0; i < self.tags.count; i++) {
        NSUInteger count = [self.counts[i] unsignedIntegerValue];
        [self addTagWithText:self.tags[i] count:count];
    }
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width, self.y + self.configuration.tagViewHeight + 2 * self.margin);
}

- (void)addTagWithText:(NSString *)text count:(NSUInteger)count {
    CGFloat fontSize;
    if ([self.counts[0] unsignedIntegerValue] == [self.counts[self.counts.count - 1] unsignedIntegerValue]) {
        fontSize = (self.maxFontSize + self.minFontSize) / 2.f;
    } else {
        fontSize = self.minFontSize + (self.maxFontSize - self.minFontSize) * (count - [self.counts[self.counts.count - 1] unsignedIntegerValue]) / ([self.counts[0] unsignedIntegerValue] - [self.counts[self.counts.count - 1] unsignedIntegerValue]);
    }
    CGFloat width = [PFTagViewCell widthWithText:text
                                       count:count
                                    fontSize:fontSize
                                    maxWidth:self.maxWidth
                                   maxHeight:self.configuration.tagViewHeight
                          countLabelFontSize:self.configuration.tagViewCountLabelFontSize];
    
    if (self.x + self.margin + width > self.frame.size.width - self.margin) {
        self.x = 0;
        self.y += 2 * self.margin + self.lineHeight;
        self.maxWidth = self.frame.size.width - self.margin;
        width = [PFTagViewCell widthWithText:text
                                   count:count
                                fontSize:fontSize
                                maxWidth:self.maxWidth
                               maxHeight:self.configuration.tagViewHeight
                      countLabelFontSize:self.configuration.tagViewCountLabelFontSize];
    }
    if (self.x == 0) {
        self.lineHeight = fontSize;
    }
    PFTagViewCell *view = [[PFTagViewCell alloc] initWithFrame:CGRectMake(self.x + self.margin, self.y + self.margin, width, self.configuration.tagViewHeight)
                                                  text:text
                                                 count:count
                                              fontSize:fontSize
                                         configuration:self.configuration];
    self.maxWidth -= width - 2 * self.margin;
    self.x += width + 2 * self.margin;
    [self.scrollView addSubview:view];
    [self.views addObject:view];
}

- (void)removeAllSubviews {
    for (UIView *view in self.views) {
        [view removeFromSuperview];
    }
}

- (void)sortDict {
    self.tags = [self.dict keysSortedByValueUsingComparator: ^(id obj1, id obj2) {
        NSUInteger value1 = [obj1 unsignedIntegerValue];
        NSUInteger value2 = [obj2 unsignedIntegerValue];
        if (value1 > value2) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *key in self.tags) {
        [array addObject:[self.dict valueForKey:key]];
    }
    self.counts = array;
}

@end
