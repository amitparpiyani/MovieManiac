//
//  PreloaderViewController.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 13/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreloaderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
