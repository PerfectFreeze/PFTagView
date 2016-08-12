//
//  PFTagView.h
//  PFTagView
//
//  Created by Cee on 10/08/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFTagViewCell.h"

@interface PFTagView : UIView

- (id)initWithFrame:(CGRect)frame
               dict:(NSDictionary *)dict
             config:(PFTagViewConfiguration *)configuration;

@end
