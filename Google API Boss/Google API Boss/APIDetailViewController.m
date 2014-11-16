//
//  APIDetailViewController.m
//  Google API Boss
//
//  Created by Benjamin Friedman on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

#import "APIDetailViewController.h"

@implementation APIDetailViewController

@synthesize apiTitle;
@synthesize apiDescrip;
@synthesize apiImage;
@synthesize currentApi;
@synthesize randomButton;

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.shouldShowRandom = true;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if(self.shouldShowRandom) {
        [self onRandomSelected: 0];
    } else {
        [randomButton setHidden: YES];
    }
}

-(void)showSpecificApi:(GoogleAPI *) gapi {
    self.shouldShowRandom = false;
    apiTitle.text = gapi.title;
    apiDescrip.text = gapi.apiDescription;
    
    apiImage.image = nil;
    
    //set here
    [self performSelectorInBackground: @selector(fetchAPiImageFromGapi:) withObject: gapi];
}

-(void)fetchAPiImageFromGapi: (GoogleAPI *) gapi {
    NSURL *url = [NSURL URLWithString: gapi.icon32];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    [self performSelectorOnMainThread: @selector(presentApiImage:) withObject: image waitUntilDone: NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onRandomSelected:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSDictionary *dict = delegate.apiDictionary;
    
    NSArray *array = [dict valueForKey: @"items"];
    int random = arc4random()%[array count];
    [self fetchApiWithIndex: random];
}

-(void)fetchApiWithIndex: (int) index {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSDictionary *dict = delegate.apiDictionary;
    
    NSArray *array = [dict valueForKey: @"items"];
    NSDictionary *item = [array objectAtIndex: index];
    
    self.currentApi = item;
    
    apiTitle.text = [item valueForKey: @"title"];
    apiDescrip.text = [item valueForKey: @"description"];
    
    apiImage.image = nil;
    
    //set here
    [self performSelectorInBackground: @selector(fetchApiImage:) withObject: item];
}

-(void)fetchApiImage: (NSDictionary *) item {
    NSDictionary *icons = [item valueForKey: @"icons"];
    NSURL *url = [NSURL URLWithString: [icons valueForKey: @"x32"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    [self performSelectorOnMainThread: @selector(presentApiImage:) withObject: image waitUntilDone: NO];
}

-(void)presentApiImage: (UIImage *) image {
    apiImage.image = image;
}

-(IBAction)onInterestedSelected:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [self.currentApi valueForKey: @"documentationLink"]]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
