//
//  FINNewMoveVw.h
//  Finanzas
//
//  Created by juancarlos on 17/10/13.
//  Copyright (c) 2013 juancarlos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FINNewMoveVw : UIView

-(void)changeColor;

@property (strong, nonatomic) UIColor* currentColor;
@property (strong, nonatomic) UIColor* alternateColor;
@property (strong, nonatomic) UIButton *myButton ;

@end
