//
//  SachinTendulkar.m
//  Pods-SachinTendulkar_Example
//
//  Created by Arpit Panda on 12/04/19.
//

#import "SachinTendulkar.h"

@implementation SachinTendulkar

+ (BOOL)didHeScore:(int)score desc:(NSString **)description {
    NSString *fileContents = [NSString stringWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"sachin" ofType:@"csv"] encoding:NSUTF8StringEncoding error:nil];

    NSArray* rows = [fileContents componentsSeparatedByString:@"\n"];
    for (NSString *row in rows){
        NSArray* columns = [row componentsSeparatedByString:@","];
        if ([columns[0] isEqualToString:@"DNB"] || [columns[0] isEqualToString:@"TDNB"]) {
            continue;
        } else {
            if ([columns[0] intValue] == score) {
                *description = [NSString stringWithFormat:@"Yes! in %@, against, %@",columns[6],columns[5]];
                return YES;
            }
        }
    }
    *description = @"Sadly he didn't score this number";
    return NO;
}

@end
