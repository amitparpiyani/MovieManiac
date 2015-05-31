//
//  Movies.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 12/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "Movie.h"
@interface Movies : JSONModel
@property(nonatomic,assign)NSInteger currentPage;
@property(nonatomic,assign)NSInteger totalPages;
@property(nonatomic,assign)NSInteger totalResults;
@property(nonatomic,strong)NSArray<Movie> *moviesArray;
@end
