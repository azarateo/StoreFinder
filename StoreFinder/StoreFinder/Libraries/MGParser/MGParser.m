

#import "MGParser.h"

@implementation MGParser


+(NSDictionary*) getJSONAtURL:(NSString*)urlStr {
    NSURL* url = [NSURL URLWithString:urlStr];
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSDictionary* resultsDictionary = [data objectFromJSONDataWithParseOptions:JKParseOptionLooseUnicode];
    
    return resultsDictionary;
}

+(NSArray*) getJSONArayAtURL:(NSString*)urlStr {
    NSURL* url = [NSURL URLWithString:urlStr];
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSArray* resultsDictionary = [data objectFromJSONDataWithParseOptions:JKParseOptionLooseUnicode];
    
    return resultsDictionary;
}

@end
