//
//  Movie.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 11/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "Movie.h"

@implementation Movie
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"movieId",
                                                       @"adult": @"isAdult",
                                                       @"video": @"isVideoAvailable",
                                                       @"original_title" : @"originalTitle",
                                                       @"poster_path" : @"posterPath",
                                                       @"backdrop_path" : @"backdropPath",
                                                       @"release_date" : @"releaseDate",
                                                       @"vote_average" : @"voteAverage",
                                                       @"vote_count" : @"voteCount",
                                                       @"overview" : @"movieOverview"
                                                       }];
}

@end
