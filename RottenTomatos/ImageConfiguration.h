//
//  ImageConfiguration.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 13/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//
@protocol ImageConfiguration
@end
#import "JSONModel.h"

@interface ImageConfiguration : JSONModel
@property(nonatomic,strong)NSString *baseUrl;
@property(nonatomic,strong)NSString *secureBaseUrl;
//@property(nonatomic,strong)NSArray *backdropSizes;

@end
