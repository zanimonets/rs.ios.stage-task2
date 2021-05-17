#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger arrayCount = [array count];
    NSInteger counter = 0;
    
    for (int i = 0; i < arrayCount; i++) {
        for (int j = i + 1; j < arrayCount; j++) {
            if (abs([array[i] intValue] - [array[j] intValue]) == [number intValue]) {
                counter++;
            }
        }
    }
    
    return counter;
}

@end
