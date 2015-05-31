//
//  ImageConfiguration.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 13/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "ImageConfiguration.h"

@implementation ImageConfiguration
//@"backdrop_sizes": @"backdropSizes"

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                  @"base_url":@"baseUrl",
                                                  @"secure_base_url" : @"secureBaseUrl"
                                                  }
            ];
}
@end
