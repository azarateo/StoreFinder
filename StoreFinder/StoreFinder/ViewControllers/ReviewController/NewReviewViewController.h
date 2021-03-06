//
//  NewReviewViewController.h
//  StoreFinder
//
//
//  Copyright (c) 2014 Mangasaur Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ReviewDelegate <NSObject>

-(void)didReceiveNewReview:(NSDictionary*)dict;

@end

@interface NewReviewViewController : UIViewController {
    
    __weak id <ReviewDelegate> _reviewDelegate;
}

@property (nonatomic, weak) id <ReviewDelegate> reviewDelegate;

@property (nonatomic, retain) IBOutlet UIButton* buttonCancel;
@property (nonatomic, retain) IBOutlet UIButton* buttonPost;
@property (nonatomic, retain) IBOutlet UITextView* textViewReview;
@property (nonatomic, retain) IBOutlet UILabel* labelCharsLeft;

@property (nonatomic, retain) Store* store;

-(IBAction)didClickButtonCancel:(id)sender;
-(IBAction)didClickButtonPost:(id)sender;

@end
