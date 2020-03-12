#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSUInteger len = [s length];
    if (len != [n intValue]) return @"-1";

    int minChangesRequired = 0;
    for (int i=0; i<len/2; i++){
        if ([s characterAtIndex:i] != [s characterAtIndex:len-i-1]) minChangesRequired++;
    }

    if ([k intValue] >= minChangesRequired) {
        int diff = 0;
        if ([k intValue] > minChangesRequired){
            diff = [k intValue] - minChangesRequired;
            for (int l=0; l<diff; l++){
                s = [s stringByReplacingCharactersInRange:NSMakeRange(l, 1) withString:@"9"];
                s = [s stringByReplacingCharactersInRange:NSMakeRange(len-l-1, 1) withString:@"9"];
            }
        }
        for (int i=diff; i<len-diff/2; i++){
            if ([s characterAtIndex:i] != [s characterAtIndex:len-i-1]){
                int curValue = [s characterAtIndex:i] - 48;
                int cur2Value = [s characterAtIndex:len-i-1] - 48;
                int greater = (curValue > cur2Value)? curValue : cur2Value;
                if (curValue != greater){
                    s = [s stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString: [NSString stringWithFormat:@"%d",cur2Value]];
                }else{
                    s = [s stringByReplacingCharactersInRange:NSMakeRange(len-i-1, 1) withString:[NSString stringWithFormat:@"%d",curValue]];
                }
            }
        }
        return s;
    }
    return @"-1";
}

@end
