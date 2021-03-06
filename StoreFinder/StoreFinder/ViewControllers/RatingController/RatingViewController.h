//
//  RatingViewController.h
//  StoreFinder
//
//
//  Copyright (c) 2014 Mangasaur Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RatingDelegate <NSObject>

-(void)didReceiveNewRating:(NSDictionary*)dict store:(Store*)store;

@end

@interface RatingViewController : UIViewController {
    
    __weak id <RatingDelegate> _ratingDelegate;
}

@property (nonatomic, weak) id <RatingDelegate> ratingDelegate;

@property (nonatomic, retain) Store* store;
@property (nonatomic, retain) IBOutlet UIButton* buttonCancel;
@property (nonatomic, retain) IBOutlet UIButton* buttonPost;
@property (nonatomic, retain) IBOutlet UILabel* labelRatingText;
@property (nonatomic, retain) IBOutlet RateView* ratingView;

-(IBAction)didClickButtonCancel:(id)sender;
-(IBAction)didClickButtonPost:(id)sender;

@end
