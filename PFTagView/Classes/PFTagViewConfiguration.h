//
//  PFTagViewConfiguration.h
//  PFTagView
//
//  Created by Cee on 10/08/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFTagViewConfiguration : NSObject

@property (nonatomic, assign) CGFloat maxFontSize;
@property (nonatomic, assign) CGFloat minFontSize;
@property (nonatomic, strong) UIColor *tagViewMainTextColor;
@property (nonatomic, strong) UIColor *tagViewCountLabelTextColor;
@property (nonatomic, assign) CGFloat tagViewCountLabelFontSize;
@property (nonatomic, assign) CGFloat tagViewHeight;
@property (nonatomic, assign) CGFloat tagViewMargin;

@end
