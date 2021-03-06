//
//  Category.h
//  StoreFinder
//
//
//  Copyright (c) 2014 Mangasaur Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StoreCategory : NSManagedObject

@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * updated_at;
@property (nonatomic, retain) NSString * created_at;
@property (nonatomic, retain) NSString * category_icon;
@property (nonatomic, retain) NSString * category;

@end
