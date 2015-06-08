//
//  MovieInformationCell.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 31/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@interface MovieInformationCell : UITableViewCell
-(void)updateCellWithMovieInformation:(Movie *)movieInfo;

@end
