//
//  PFTagView.m
//  PFTagView
//
//  Created by Cee on 10/08/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import "PFTagView.h"

@interface PFTagView ()
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, assign) CGFloat height;
@end

@implementation PFTagView

- (id)initWithFrame:(CGRect)frame
               text:(NSString *)text
              count:(NSUInteger)count
           fontSize:(CGFloat)fontSize
      configuration:(PFTagViewConfiguration *)configuration {
    self = [super initWithFrame:frame];
    if (self) {
        self.textLabel.textColor = configuration.tagViewMainTextColor;
        self.countLabel.textColor = configuration.tagViewCountLabelTextColor;
        self.height = configuration.tagViewHeight;
        self.textLabel.text = text;
        self.textLabel.font = [UIFont systemFontOfSize:fontSize
                                                weight:UIFontWeightThin];
        self.countLabel.text = [NSString stringWithFormat:@"%ld", count];
        self.countLabel.font = [UIFont systemFontOfSize:configuration.tagViewCountLabelFontSize
                                                 weight:UIFontWeightUltraLight];
        [self setup];
    }
    return self;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] initWithFrame:self.frame];
        _textLabel.numberOfLines = 1;
    }
    return _textLabel;
}

- (UILabel *)countLabel {
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] initWithFrame:self.frame];
        _countLabel.numberOfLines = 1;
        
    }
    return _countLabel;
}


+ (CGFloat)widthWithText:(NSString *)text
                   count:(NSUInteger)count
                fontSize:(CGFloat)fontSize
                maxWidth:(CGFloat)maxWidth
               maxHeight:(CGFloat)maxHeight
      countLabelFontSize:(CGFloat)countLabelFontSize {
    NSString *countString = [NSString stringWithFormat:@"%ld", count];
    CGFloat countLabelWidth = [countString boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHeight)
                                               options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:countLabelFontSize]}
                                               context:nil].size.width;
    CGFloat textWidth = [text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                         context:nil].size.width;
    
    return textWidth + countLabelWidth;
}

- (void)setup {
    [self layoutSubviews];
    [self addSubview:self.textLabel];
    [self addSubview:self.countLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize countLabelSize = [self.countLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.height)
                                                               options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                            attributes:@{NSFontAttributeName:self.countLabel.font}
                                                               context:nil].size;
    
    
    CGSize textSize = [self.textLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width - countLabelSize.width, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:@{NSFontAttributeName:self.textLabel.font}
                                           context:nil].size;
    self.textLabel.frame = CGRectMake(0, self.height - MIN(textSize.height, self.height),
                                      textSize.width, MIN(textSize.height, self.height));
    self.countLabel.frame = CGRectMake(self.frame.size.width - countLabelSize.width,
                                       self.height - self.textLabel.frame.size.height - countLabelSize.height / 2.f,
                                       countLabelSize.width, countLabelSize.height);
}

@end
