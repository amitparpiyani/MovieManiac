//
//  MovieTableViewCell.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 13/04/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//
#import "MovieTableViewCell.h"
#import "Constants.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface MovieTableViewCell ()
{
    Movie *movieModal;
}
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *ratingLbl;
@property (weak, nonatomic) IBOutlet UILabel *voteCounts;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;


@end

@implementation MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.moviePoster.image = [UIImage imageNamed:@"defaultMovie.png"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateCellWithMovieObject:(Movie *)movie
{
    self.movieTitle.text = movie.title;
    self.ratingLbl.text = [NSString stringWithFormat:@"%.1f",movie.voteAverage];
    self.releaseDate.text = movie.releaseDate;
    self.voteCounts.text = [[NSString alloc] initWithFormat:@"%ld",(long)movie.voteCount];
    self.moviePoster.image = [UIImage imageNamed:@"defaultMovie.png"];

    
    
}

-(void)updateMovieThumbnail:(NSString *)path
{
    NSString *imageUrl = [IMAGE_BASE_URL stringByAppendingString:path];
    [self.moviePoster sd_setImageWithURL:[NSURL URLWithString:imageUrl]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                             }];
}


@end
