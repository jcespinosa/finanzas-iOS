//
//  FINAccntDetailsVwCtrl.h
//  Finanzas
//
//  Created by juancarlos on 22/10/13.
//  Copyright (c) 2013 juancarlos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FINAccntDetailsVwCtrl : UITableViewController

-(void)populateList:(NSString*)filename;
-(void)deleteAccount;

@property (strong, nonatomic) NSMutableArray* details;
@property (nonatomic) NSInteger* dir;
@property (strong, nonatomic) NSIndexPath* indexPath;
@property (strong, nonatomic) NSString* filename;

@end
