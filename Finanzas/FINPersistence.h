//
//  FINPersistence.h
//  Finanzas
//
//  Created by juancarlos on 17/10/13.
//  Copyright (c) 2013 juancarlos. All rights reserved.
//

#import <Foundation/Foundation.h>

//FOUNDATION_EXPORT NSString *const FILENAME;

@interface FINPersistence : NSObject

-(id)init:(NSString*)filename;
-(void)load;
-(void)save:(NSMutableString*)newAccountList;
-(NSString*)query;
-(void)useNotificationWithString:(NSNotification*)notification;
-(void)dealloc;

@property (strong, retain) NSString* filename;
@property (strong, retain) NSString* contenido;

@end
