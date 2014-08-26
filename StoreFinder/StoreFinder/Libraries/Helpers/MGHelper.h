

#ifndef RestaurantLocator_MGHelper_h
#define RestaurantLocator_MGHelper_h

#define CURRENT_IDIOM UI_USER_INTERFACE_IDIOM()

#define IS_IPAD UIUserInterfaceIdiomPad

#define IS_IPHONE UIUserInterfaceIdiomPhone

#define DOES_SUPPORT_IOS6_1_OR_BELOW (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) ? YES : NO

#define DOES_SUPPORT_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) ? YES : NO

#define LOCALIZED(str) NSLocalizedString(str, nil)

#define LOCALIZED_NOT_NULL(str) NSLocalizedString(str, @"")



#endif
