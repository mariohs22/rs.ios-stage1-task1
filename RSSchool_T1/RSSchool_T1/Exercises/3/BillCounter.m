#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *tmpBill;
    
    tmpBill = [NSMutableArray array];
    [tmpBill addObjectsFromArray:bill];
    [tmpBill removeObjectAtIndex:index];
    NSNumber *partAnna = [tmpBill valueForKeyPath:@"@sum.self"];
    NSUInteger dpartAnna = [partAnna intValue] / 2;
    NSUInteger toAnna = [sum intValue] - dpartAnna;
    
    NSString *result = ([sum intValue] == dpartAnna)? @"Bon Appetit" :
        (toAnna > 0)? [NSString stringWithFormat: @"%lu", toAnna] : @"Bon Appetit";
    return result;
}

@end
