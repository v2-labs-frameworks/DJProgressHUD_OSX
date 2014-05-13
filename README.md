DJProgressHUD_osx
=================

Progress and Activity HUD for OSX.

I am really excited to introduce this ProgressHUD for osx. When I started my first osx app, I noticed that there was not good alternative to SVProgressHUD for the mac. Because this is a such a great tool for displaying a process, I decided to write it for the mac.

Please let me know if you find this helpfull!

![Screenshot](http://www.danmjacks.com/wp-content/uploads/2014/05/Screen-Shot-2014-05-13-at-11.28.37-AM.png)

##Whats included: 
  - DJProgressHUD: A class to show a popup view to the user displaying the current progress or an activity indicator.
  - DJActivityIndicator: A customizable activity indicator. The mac's version, NSProgressIndicator, just doesn't cut it.
  - DJProgressIndicator: A customizable circular progress view. Change the thickness, radius, size and color. I couldnt find one for the mac. So again, I made one.

##Code Sample

Simple Progress - uses progress indicator

    CGFloat currentProgress = 0.33;
    [DJProgressHUD showProgress:currentProgress withStatus:@"The Progress!" FromView:self.view];
    ...
    [DJProgressHUD dismiss];

Simple Status - uses activity indicator

    [DJProgressHUD showStatus:@"INDICATOR" FromView:self.view];
    ...
    [DJProgressHUD dismiss];

Progress Indicator - Customizing

    DJProgressIndicator* progress = [[DJProgressIndicator alloc] initWithFrame: ... ];
    [progress setRingThickness:8];
    [progress setRingRadius:15];
    [progress setBackgroundColor:[NSColor clearColor]];
    [progress setRingColor:[NSColor whiteColor] backgroundRingColor:[NSColor darkGrayColor]];
    [self.view addSubview:progress];
    [progress showProgress: 0.33 ];

##Credit where credit is due:
  
I modeled much of my code off of [SVProgressHUD](https://github.com/samvermette/SVProgressHUD). Its a great project.
