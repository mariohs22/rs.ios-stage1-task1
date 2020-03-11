#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *result;
    NSArray *res;
    result = [NSMutableArray array];
    res = [NSArray array];

    NSUInteger cnt;
    cnt = [sadArray count];
    if (cnt <= 2) return sadArray;
    
    [result addObject: [sadArray firstObject]];
    int i;
    for (i = 1; i < cnt-1; i++) {
        id prevElement = [sadArray objectAtIndex:i-1];
        id currElement = [sadArray objectAtIndex:i];
        id nextElement = [sadArray objectAtIndex:i+1];
        if (([prevElement intValue] + [nextElement intValue]) > [currElement intValue]){
            [result addObject:currElement];
        }
    }
    [result addObject: [sadArray lastObject]];

    bool flag = [result isEqualToArray:sadArray];
    res = (flag)? result : [self convertToHappy:result];
    return res;
}

@end
