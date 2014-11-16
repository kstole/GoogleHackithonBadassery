//
//  APIDetailViewController.h
//  Google API Boss
//
//  Created by Benjamin Friedman on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface APIDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *apiTitle;
@property (nonatomic, strong) IBOutlet UILabel *apiDescrip;
@property (nonatomic, strong) IBOutlet UIImageView *apiImage;
@property (nonatomic, strong) NSDictionary *currentApi;

-(IBAction)onRandomSelected:(id)sender;

-(IBAction)onInterestedSelected:(id)sender;

@end
