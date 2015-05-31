//
//  MovieTableViewCell.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 13/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@interface MovieTableViewCell : UITableViewCell
-(void)updateCellWithMovieObject:(Movie *)movie;
-(void)updateMovieThumbnail:(NSString *)path;

@end
