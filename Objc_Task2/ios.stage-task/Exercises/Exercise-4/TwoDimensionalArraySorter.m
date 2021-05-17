#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *combinedStings = [NSMutableArray new];
    NSMutableArray *combinedNumbers = [NSMutableArray new];
    
    
    for (int i = 0; i < [array count]; i++) {
        if ([array[i] isKindOfClass:NSArray.class]) {
            if ([array[i].firstObject isKindOfClass:NSString.class]) {
                [combinedStings addObjectsFromArray:array[i]];
            } else if ([array[i].firstObject isKindOfClass:NSNumber.class]) {
                [combinedNumbers addObjectsFromArray:array[i]];
            }
        } else {
            return @[];
        }
    }
    
    NSMutableArray *ascendingOrderStrings = [combinedStings sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *ascendingOrderNumbers = [combinedNumbers sortedArrayUsingSelector:@selector(compare:)];
    
    if ([combinedStings count] > 0 && [combinedNumbers count] > 0){
        NSMutableArray *combinedArray = [NSMutableArray new];
        
        NSArray* descendingOrderStrings = [[ascendingOrderStrings reverseObjectEnumerator] allObjects];
        [combinedArray addObject:ascendingOrderNumbers];
        [combinedArray addObject:descendingOrderStrings];
        
        return combinedArray;
    }
    else if ([combinedStings count] > 0){
        return ascendingOrderStrings;
    }
    else if ([combinedNumbers count] > 0){
        return ascendingOrderNumbers;
    }
    
    return @[];
}

@end
