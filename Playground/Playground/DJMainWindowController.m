//
//  DJMainWindowController.m
//  Playground
//
//  Created by Daniel Jackson on 5/11/14.
//  Copyright (c) 2014 Daniel Jackson. All rights reserved.
//

#import "DJMainWindowController.h"
#import "DJActivityIndicator.h"
#import "DJProgressIndicator.h"
#import "DJProgressHUD.h"

@interface DJMainWindowController ()

@end

@implementation DJMainWindowController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)dealloc
{
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    
    //[super dealloc];
}

- (IBAction)start:(id)sender
{
    [activity startAnimation:nil];
}

- (IBAction)stop:(id)sender
{
    [activity stopAnimation:nil];
}

- (IBAction)progress:(id)sender
{
    static CGFloat newProgress = 0;
    newProgress = (progress.currentProgress+0.25) > 1 ? 0 : progress.currentProgress+0.25;
    
    [progress showProgress:newProgress];
}

- (IBAction)growRing:(id)sender
{
    [progress setRingThickness:progress.ringThickness+5];
}

- (IBAction)shrinkRing:(id)sender
{
    [progress setRingThickness:progress.ringThickness-5];

}

- (IBAction)growRadius:(id)sender
{
    [progress setRingRadius:progress.ringRadius+5];
}

- (IBAction)shrinkRadius:(id)sender
{
    [progress setRingRadius:progress.ringRadius-5];
}

-(IBAction)toggleRingColors:(id)sender
{
    static bool toggle = true;
    
    if(toggle) {
        [progress setBackgroundColor:[NSColor lightGrayColor]];
        [progress setRingColor:[NSColor orangeColor] backgroundRingColor:[NSColor blueColor]];
    }
    else {
        [progress setBackgroundColor:[NSColor clearColor]];
        [progress setRingColor:[NSColor whiteColor] backgroundRingColor:[NSColor darkGrayColor]];
    }
    
    toggle = !toggle;
}

- (IBAction)toggleActivityColors:(id)sender
{
    static bool toggle = true;
    
    if(toggle) {
        [activity setBackgroundColor:[NSColor lightGrayColor]];
        [activity setColor:[NSColor blueColor]];
    }
    else {
        [activity setBackgroundColor:[NSColor clearColor]];
        [activity setColor:[NSColor blackColor]];
    }
    
    toggle = !toggle;
}

NSTimer* timer;

- (IBAction)activityPopup:(id)sender
{
    [DJProgressHUD showStatus:@"INDICATOR" FromView:self.view];
    
    [timer invalidate];
    timer = nil;
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(dismissProgressView) userInfo:nil repeats:NO];
}

- (void)dismissProgressView
{
    [DJProgressHUD dismiss];
    
    [timer invalidate];
    timer = nil;
}

- (IBAction)progressPopup:(id)sender
{
    [DJProgressHUD showProgress:0 withStatus:@"The Progress!" FromView:self.view];
    
    [timer invalidate];
    timer = nil;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(continueProgress) userInfo:nil repeats:YES];
}

- (void)continueProgress
{
    static float prog = 0;
    
    
    prog += 0.334;
    
    if(prog > 1.1) {
        [DJProgressHUD dismiss];
        prog = 0;
        [timer invalidate];
        timer = nil;
    }
    else {
        [DJProgressHUD showProgress:prog withStatus:@"The Progress!" FromView:self.view];
    }
    
}

@end
