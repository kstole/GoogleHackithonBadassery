//
//  AppDelegate.m
//  Google API Boss
//
//  Created by Benjamin Friedman on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize apiDictionary;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //perform calls for Json data asynchronously
    NSURL *url = [[NSURL alloc] initWithString: @"https://www.googleapis.com/discovery/v1/apis?list"];
    
    
    // Authorization: OAuth {YOUR_ACCESS_TOKEN}
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    //[request setValue: [NSString stringWithFormat: @"Bearer %@", [self auth].accessToken] forHTTPHeaderField: @"Authorization"];
    //[request setHTTPMethod:@"GET"];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest: request delegate: self];
    if(!conn) {
        NSLog(@"FAiled sending our rest Request");
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

///////////////////////////////////////////
//  CONNECTION HANDLING CODE
///////////////////////////////////////////
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //for json you do not translate it beforehand, it's handled as part of the process
    //NSString *str = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    //NSLog(@"%@", str);
    [self mapJSON: data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Connection has finished loading");
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection did fail with err:%@", error);
}

///////////////////////////////////////////
//  FIN
///////////////////////////////////////////

-(void)mapJSON: (NSData *) json {
    NSError *error;
    NSDictionary *values = [NSJSONSerialization JSONObjectWithData: json options: 0 error: &error];
    self.apiDictionary = values;
    
    /*
    for(NSString *key in values) {
        NSLog(@"KEY:%@", key);
        if([key isEqualToString: @"message"]) {
            NSLog(@"\n%@\n", [values valueForKey: key]);
            return;
        }
    }
    */
    
    /*
    NSDictionary *items = [values valueForKey: @"items"];
    for(NSDictionary *api in items) {
        
        NSString *printerName = [[api valueForKey: @"title"] lowercaseString];
        ///////[self.printerList addObject: dict];
        NSLog(@"%@", printerName);
        //Handles AUTO sending a print job
        // if ([printerName rangeOfString:@"viewplus"].location != NSNotFound) {
        // NSLog(@"Target printer found!");
        //
        // [self submitPrintJob: dict];
        // break;
        //}
    }
     */

    //refresh our tableView with our new data!
    //////[self.tableView reloadData];
    
    
    if(error != nil) {
        NSLog(@"Error with changing json into dictionary");
        return;
    }
}

@end
