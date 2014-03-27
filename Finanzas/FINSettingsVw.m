//
//  FINSettingsVw.m
//  Finanzas
//
//  Created by juancarlos on 17/10/13.
//  Copyright (c) 2013 juancarlos. All rights reserved.
//

#import "FINSettingsVw.h"

@implementation FINSettingsVw

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.currentColor = [UIColor blackColor];
        self.alternateColor = [UIColor whiteColor];
        self.backgroundColor = self.currentColor;
        self.myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.myButton addTarget:self
                          action:@selector(changeColor)
                forControlEvents:UIControlEventTouchDown];
        [self.myButton setTitle:@"CONFIGURACION" forState:UIControlStateNormal];
        self.myButton.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
        [self addSubview:self.myButton];
    }
    return self;
}

-(void)changeColor
{
    UIColor* use = self.alternateColor;
    self.alternateColor = self.backgroundColor;
    self.currentColor = use;
    self.backgroundColor = self.currentColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
