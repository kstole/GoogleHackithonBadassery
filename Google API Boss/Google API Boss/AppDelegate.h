//
//  AppDelegate.h
//  Google API Boss
//
//  Created by Benjamin Friedman on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, readonly) NSDictionary *apiDictionary;
@property (strong, nonatomic) NSMutableData *mutaData;

-(void)mapJSON: (NSData *) json;

@end

