//
//  MovieDetails.h
//  RottenTomatos
//
//  Created by Amit Parpiyani on 12/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
@interface MovieDetails : JSONModel
@property(nonatomic,retain)NSString  *movieId;
@property(nonatomic,retain)NSString  *imdb_id;
@property(nonatomic,retain)NSString  *overview;
@property(nonatomic,retain)NSString<Optional>  *budget;
@property(nonatomic,retain)NSString<Optional>  *belongsTOCollection;
@property(nonatomic,retain)NSString  *originalLanguage;
@property(nonatomic,retain)NSString<Optional>  *homePage;
@property(nonatomic,assign)BOOL isAdult;
@property(nonatomic,retain)NSString  *originalTitle;
@property(nonatomic,retain)NSString  *title;
@property(nonatomic,retain)NSString<Optional>  *posterPath;
@property(nonatomic,retain)NSString<Optional>  *backdropPath;
@property(nonatomic,retain)NSString<Optional>  *tagline;
@property(nonatomic,retain)NSString  *status;
@property(nonatomic,retain)NSString *releaseDate;
@property(nonatomic,assign)float voteAverage;
@property(nonatomic,assign)NSInteger voteCount;
@property(nonatomic,assign)NSString<Optional> *runtime;
@property(nonatomic,assign)NSString<Optional> *revenue;
@property(nonatomic,retain)NSString *popularity;
@property(nonatomic,assign)BOOL isVideoAvailable;
@end
