//
//  APIDetailViewController.h
//  Google API Boss
//
//  Created by Benjamin Friedman on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Google_API_Boss-Swift.h"

@interface APIDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *apiTitle;
@property (nonatomic, strong) IBOutlet UILabel *apiDescrip;
@property (nonatomic, strong) IBOutlet UIImageView *apiImage;
@property (nonatomic, strong) NSDictionary *currentApi;
@property (nonatomic) bool shouldShowRandom;
@property (nonatomic, strong) IBOutlet UIButton *randomButton;

-(IBAction)onRandomSelected:(id)sender;

-(void)fetchApiWithIndex: (int) index;

-(IBAction)onInterestedSelected:(id)sender;

-(void)fetchApiImage: (NSDictionary *) item;

-(void)presentApiImage: (UIImage *) image;

-(void)showSpecificApi: (GoogleAPI *) gapi;

@end
