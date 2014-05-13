//
//  DJMainWindowController.h
//  Playground
//
//  Created by Daniel Jackson on 5/11/14.
//  Copyright (c) 2014 Daniel Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DJActivityIndicator, DJProgressIndicator;

@interface DJMainWindowController : NSObject
{
    IBOutlet DJActivityIndicator* activity;
    IBOutlet DJProgressIndicator* progress;
}

@property (nonatomic) IBOutlet NSView* view;
@property (nonatomic) IBOutlet NSWindow* window;

#pragma mark Activity Actions

- (IBAction)toggleActivityColors:(id)sender;

- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)progress:(id)sender;

- (IBAction)activityPopup:(id)sender;

#pragma mark Progress Actions

- (IBAction)toggleRingColors:(id)sender;

- (IBAction)growRing:(id)sender;
- (IBAction)shrinkRing:(id)sender;

- (IBAction)growRadius:(id)sender;
- (IBAction)shrinkRadius:(id)sender;

- (IBAction)progressPopup:(id)sender;


@end
