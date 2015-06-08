//
//  MovieInformationCell.m
//  RottenTomatos
//
//  Created by Amit Parpiyani on 31/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "MovieInformationCell.h"
#import "Constants.h"
#import "RatingLabel.h"
#import "UIColor-Expanded.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieInformationCell ()
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLbl;
@property (weak, nonatomic) IBOutlet UILabel *movieDescription;
@property (weak, nonatomic) IBOutlet RatingLabel *fifthRatingLbl;
@property (weak, nonatomic) IBOutlet RatingLabel *forthRatingLbl;
@property (weak, nonatomic) IBOutlet RatingLabel *thirdRatingLbl;
@property (weak, nonatomic) IBOutlet RatingLabel *secondRatingLbl;
@property (weak, nonatomic) IBOutlet RatingLabel *firstRatingLbl;




@end
@implementation MovieInformationCell

- (void)awakeFromNib {
    // Initialization code
    [self layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithMovieInformation:(Movie *)movieInfo
{
    [self updateMovieThumbnail:movieInfo.posterPath];
    [self setMovieTitle:movieInfo.title andType:movieInfo.isAdult];
    self.releaseDateLbl.text = movieInfo.releaseDate;
    self.movieDescription.text = movieInfo.movieOverview;
    [self.firstRatingLbl setLblTextFromRating:movieInfo.voteAverage];
    [self.firstRatingLbl setTextColor:[UIColor colorWithHexString:RATING_STAR_COLOR]];
    [self.secondRatingLbl setTextColor:[UIColor colorWithHexString:RATING_STAR_COLOR]];
    [self.thirdRatingLbl setTextColor:[UIColor colorWithHexString:RATING_STAR_COLOR]];
    [self.forthRatingLbl setTextColor:[UIColor colorWithHexString:RATING_STAR_COLOR]];
    [self.fifthRatingLbl setTextColor:[UIColor colorWithHexString:RATING_STAR_COLOR]];
    [self.secondRatingLbl setLblTextFromRating:movieInfo.voteAverage];
    [self.thirdRatingLbl setLblTextFromRating:movieInfo.voteAverage];
    [self.forthRatingLbl setLblTextFromRating:movieInfo.voteAverage];
    [self.fifthRatingLbl setLblTextFromRating:movieInfo.voteAverage];

    
    
    
}
-(void)setMovieTitle:(NSString *)movieTitle andType:(BOOL)isAdult
{
    NSString *movieType = [[NSString alloc] initWithFormat:@"(%@)",isAdult?@"A":@"U/A"];
    NSString *movieTitleWithType = [[NSString alloc] initWithFormat:@"%@%@",movieTitle,movieType];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:movieTitleWithType];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[movieTitleWithType rangeOfString:movieType]];
    self.movieNameLbl.attributedText = attributedString;

}

-(void)updateMovieThumbnail:(NSString *)path
{
    self.movieImage.image = [UIImage imageNamed:@"defaultMovie.png"];
    if (path!=nil)
    {
        NSString *imageUrl = [IMAGE_BASE_URL stringByAppendingString:path];
        
        [self.movieImage sd_setImageWithURL:[NSURL URLWithString:imageUrl]
                           placeholderImage:[UIImage imageNamed:@"defaultMovie.png"]
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                  }];

    }
}




@end
