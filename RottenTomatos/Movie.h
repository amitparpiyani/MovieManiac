//
//  Movie.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 11/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <JSONModel.h>
@protocol Movie
@end

@interface Movie:JSONModel
@property(nonatomic,retain)NSString  *movieId;
@property(nonatomic,assign)BOOL isAdult;
@property(nonatomic,retain)NSString  *originalTitle;
@property(nonatomic,retain)NSString  *title;
@property(nonatomic,retain)NSString<Optional>  *posterPath;
@property(nonatomic,retain)NSString<Optional>  *backdropPath;
@property(nonatomic,retain)NSString *releaseDate;
@property(nonatomic,assign)float voteAverage;
@property(nonatomic,assign)NSInteger voteCount;
@property(nonatomic,retain)NSString *popularity;
@property(nonatomic,assign)BOOL isVideoAvailable;
@property (nonatomic,strong)NSString<Optional> *movieOverview;
@end
