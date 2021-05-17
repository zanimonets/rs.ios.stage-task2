#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    NSString *binaryRepresentation = @"" ;
       while (n>0) {
           binaryRepresentation = [[NSString stringWithFormat: @"%i", n&1] stringByAppendingString:binaryRepresentation];
           n = n >> 1;
       }
 
    NSMutableString *formattedBinaryRepresentation = [binaryRepresentation mutableCopy];
    if ([formattedBinaryRepresentation length] < 8) {
        while ([formattedBinaryRepresentation length] < 8) {
            [formattedBinaryRepresentation insertString:@"0" atIndex:0];
        }
    }
    
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[formattedBinaryRepresentation length]];
    [formattedBinaryRepresentation enumerateSubstringsInRange:NSMakeRange(0,[formattedBinaryRepresentation length])
                                 options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                              usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                [reversedString appendString:substring];
                            }];

    long convertedReversedStringToBinary = strtol([reversedString UTF8String], NULL, 2);
    
    return (UInt8)convertedReversedStringToBinary;
}
