//
//  PFTagViewList.h
//  PFTagView
//
//  Created by Cee on 10/08/2016.
//  Copyright © 2016 Cee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFTagView.h"

@interface PFTagViewList : UIView

- (id)initWithFrame:(CGRect)frame
               dict:(NSDictionary *)dict
             config:(PFTagViewConfiguration *)configuration;

@end
