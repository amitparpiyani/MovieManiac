//
//  Genres.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 12/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//
@protocol Genres
@end
#import "JSONModel.h"

@interface Genre : JSONModel
@property (nonatomic,strong)NSString *genreId;
@property (nonatomic,strong)NSString *generName;
@end
