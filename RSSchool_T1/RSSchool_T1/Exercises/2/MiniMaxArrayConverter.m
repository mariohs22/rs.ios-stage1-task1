#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSMutableArray *tmpArray, *summ;
    summ = [NSMutableArray array];

    for (int i = 0; i < [array count]; i++) {
        tmpArray = [NSMutableArray array];
        [tmpArray addObjectsFromArray:array];
        [tmpArray removeObjectAtIndex:i];
        [summ addObject: [tmpArray valueForKeyPath:@"@sum.self"]];
    }
    NSNumber *minValue = [summ valueForKeyPath:@"@min.self"];
    NSNumber *maxValue = [summ valueForKeyPath:@"@max.self"];
    return @[minValue, maxValue];
}

@end
