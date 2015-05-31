//
//  Movies.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 12/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "Movies.h"

@implementation Movies
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"results": @"moviesArray",
                                                       @"page": @"currentPage",
                                                       @"total_pages": @"totalPages",
                                                       @"total_results":@"totalResults"
                                                       }];
}
@end
