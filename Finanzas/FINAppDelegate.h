//
//  FINAppDelegate.h
//  Finanzas
//
//  Created by juancarlos on 17/10/13.
//  Copyright (c) 2013 juancarlos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FINNewMoveVwCtrl.h"
#import "FINMyAccountsVwCtrl.h"
#import "FINSettingsVwCtrl.h"

@interface FINAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *rootTabBarCtrl;
@property (strong, nonatomic) FINNewMoveVwCtrl *myNewMoveVwCtrl;
@property (strong, nonatomic) FINMyAccountsVwCtrl *myAccountsVwCtrl;
@property (strong, nonatomic) FINSettingsVwCtrl *settingsVwCtrl;

@property (strong, nonatomic) NSArray* viewControllers;

@end
