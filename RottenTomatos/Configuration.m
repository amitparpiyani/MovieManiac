//
//  Configuration.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 12/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "Configuration.h"
@implementation Configuration
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                      @"images":@"imagesArray"
                                                      
                                                      }
            ];
}
@end
