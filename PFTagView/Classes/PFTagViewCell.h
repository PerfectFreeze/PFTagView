//
//  PFTagViewCell.h
//  PFTagView
//
//  Created by Cee on 10/08/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFTagViewConfiguration.h"

@interface PFTagViewCell : UIView

- (id)initWithFrame:(CGRect)frame
               text:(NSString *)text
              count:(NSUInteger)count
           fontSize:(CGFloat)fontSize
      configuration:(PFTagViewConfiguration *)configuration;

+ (CGFloat)widthWithText:(NSString *)text
                   count:(NSUInteger)count
                fontSize:(CGFloat)fontSize
                maxWidth:(CGFloat)maxWidth
               maxHeight:(CGFloat)maxHeight
      countLabelFontSize:(CGFloat)countLabelFontSize;

@end
