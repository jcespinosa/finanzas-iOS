//
//  FINMyAccountsVwCtrl.h
//  Finanzas
//
//  Created by juancarlos on 17/10/13.
//  Copyright (c) 2013 juancarlos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FINAccntDetailsVwCtrl.h"

@interface FINMyAccountsVwCtrl : UITableViewController

-(void)populateList:(NSString*)filename;
-(void)newAccount;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void)createAccount:(NSString*)newAccountName;


@property (strong, nonatomic) FINAccntDetailsVwCtrl* accountDetailsVwCtrl;
@property (strong, nonatomic) NSMutableArray* accounts;

@end
