//
//  Configuration.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 12/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "JSONModel.h"
#import "ImageConfiguration.h"
@interface Configuration : JSONModel
@property(nonatomic,strong)NSArray<ImageConfiguration> *imagesArray;
@end
