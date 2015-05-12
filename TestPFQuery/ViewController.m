//
//  ViewController.m
//  TestPFQuery
//
//  Created by Nikolay Derkach on 12/05/2015.
//  Copyright (c) 2015 Nikolay Derkach. All rights reserved.
//

#import <Parse/Parse.h>

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *query = [PFUser query];
    
    // Add a sort descriptor
    NSSortDescriptor *objectidDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"objectId" ascending:YES comparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
        NSLog(@"NSSortDescriptor");
        return [obj1 compare:obj2];
    }];
    [query orderBySortDescriptor:objectidDescriptor];
    
    [query findObjectsInBackground];
}

@end
