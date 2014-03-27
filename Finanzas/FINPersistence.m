//
//  FINPersistence.m
//  Finanzas
//
//  Created by juancarlos on 17/10/13.
//  Copyright (c) 2013 juancarlos. All rights reserved.
//

#import "FINPersistence.h"

//NSString *const FILENAME = @"cuentas.txt";

@implementation FINPersistence

-(id) init:(NSString*)filename
{
    self = [super init];
    if (self) {
        self.filename = filename;
        [self load];
        if (self.contenido == nil) {
            self.contenido = @"(nada)";
        }
        NSString *notificationName = @"Store";
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(useNotificationWithString:)
         name:notificationName
         object:nil];
    }
    return self;
}

-(void) load {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *carpeta = [paths objectAtIndex:0];
    NSString *archivo = [NSString stringWithFormat:@"%@/%@", carpeta, self.filename];
    NSLog(@"Loading from file: %@", archivo);
    self.contenido = [[NSString alloc] initWithContentsOfFile:archivo
                                                 usedEncoding:nil error:nil];
    NSLog(@"Received this from local storage: %@", self.contenido);
}

-(void) save:(NSMutableString*)newAccountList {
    NSLog(@"Saving to file: %@", newAccountList);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *carpeta = [paths objectAtIndex:0];
    NSString *archivo = [NSString stringWithFormat:@"%@/%@", carpeta, self.filename];
    [newAccountList writeToFile:archivo atomically:NO encoding:NSStringEncodingConversionAllowLossy
                          error:nil];
    return;
}

-(NSString*)query {
    return self.contenido;
}

- (void)useNotificationWithString:(NSNotification*)notification {
    NSLog(@"Storage request received.");
    NSString *key = @"Store";
    NSDictionary *dictionary = [notification userInfo];
    NSString *stringValueToUse = [dictionary valueForKey:key];
    if (stringValueToUse == nil) {
        return; // not relevant
    }
    NSLog(@"Storing");
    self.contenido = stringValueToUse;
    //[self save];
    return;
}

- (void)dealloc {
    //[self save];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
