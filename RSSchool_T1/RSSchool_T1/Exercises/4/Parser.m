#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray<NSString *> *result = [@[] mutableCopy];
    NSUInteger len = [string length];
    for (int i=0; i<len; i++){
        unichar ndx = [string characterAtIndex:i];
        if (ndx == '(' || ndx == '[' || ndx == '<') {
            NSInteger endIndex = [self getEndingIndex:string brType:ndx startIndex:i];
            if (endIndex > 0)
                [result addObject: [string substringWithRange:NSMakeRange(i+1, endIndex-i-1)]];
        }
    }
    return result;
}

- (NSInteger) getEndingIndex: (NSString *) string brType:(unichar)btype startIndex:(NSInteger)index {
    NSMutableArray<NSNumber *> *stack = [@[] mutableCopy];
    unichar end_ndx;
    if (btype == '(') {end_ndx = ')';}
    else if (btype == '[') {end_ndx = ']';}
    else if (btype == '<') {end_ndx = '>';}
    else return -1;
    for (NSInteger i = index; i<[string length]; i++){
        if ([string characterAtIndex:i] == btype) {
            [stack addObject:@(i)];
        }else if ([string characterAtIndex:i] == end_ndx) {
            [stack removeLastObject];
            if ([stack count] == 0) return i;
        }
    }
    NSLog(@"STACK_%@", stack);
    return -1;
}

@end
