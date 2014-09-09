/*

 CommonUtils
 

 

 */

#import "CommonUtils.h"
#import "constants.h"


@implementation CommonUtils

static const NSArray *invalidYenEncodings;


#pragma mark Superclass Class Methods


/// クラスの初期化
+ (void)initialize

{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableArray *encodings = [NSMutableArray arrayWithCapacity:k_size_of_CFStringEncodingInvalidYenList];
        for (NSUInteger i = 0; i < k_size_of_CFStringEncodingInvalidYenList; i++) {
            NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(k_CFStringEncodingInvalidYenList[i]);
            [encodings addObject:@(encoding)];
        }
        
        invalidYenEncodings = [encodings copy];
    });
}



#pragma mark Public Class Methods


/// 非表示半角スペース表示用文字を返す
+ (unichar)invisibleSpaceChar:(NSUInteger)index

{
    NSUInteger max = k_size_of_invisibleSpaceCharList - 1;
    NSUInteger sanitizedIndex = MIN(max, index);
    
    return k_invisibleSpaceCharList[sanitizedIndex];
}



/// 非表示半角スペース表示用文字を NSString 型で返す
+ (NSString *)invisibleSpaceCharacter:(NSUInteger)index

{
    unichar theUnichar = [CommonUtils invisibleSpaceChar:index];
    
    return [NSString stringWithCharacters:&theUnichar length:1];
}



/// 非表示タブ表示用文字を返す
+ (unichar)invisibleTabChar:(NSUInteger)index

{
    NSUInteger max = k_size_of_invisibleTabCharList - 1;
    NSUInteger sanitizedIndex = MIN(max, index);
    
    return k_invisibleTabCharList[sanitizedIndex];
}



/// 非表示タブ表示用文字を NSString 型で返す
+ (NSString *)invisibleTabCharacter:(NSUInteger)index

{
    unichar theUnichar = [CommonUtils invisibleTabChar:index];
    
    return [NSString stringWithCharacters:&theUnichar length:1];
}



/// 非表示改行表示用文字を返す
+ (unichar)invisibleNewLineChar:(NSUInteger)index

{
    NSUInteger max = k_size_of_invisibleNewLineCharList - 1;
    NSUInteger sanitizedIndex = MIN(max, index);
    
    return k_invisibleNewLineCharList[sanitizedIndex];
}



/// 非表示改行表示用文字を NSString 型で返す
+ (NSString *)invisibleNewLineCharacter:(NSUInteger)index

{
    unichar theUnichar = [CommonUtils invisibleNewLineChar:index];
    
    return [NSString stringWithCharacters:&theUnichar length:1];
}



/// 非表示改行表示用文字を返す
+ (unichar)invisibleFullwidthSpaceChar:(NSUInteger)index

{
    NSUInteger max = k_size_of_invisibleFullwidthSpaceCharList - 1;
    NSUInteger sanitizedIndex = MIN(max, index);
    
    return k_invisibleFullwidthSpaceCharList[sanitizedIndex];
}



/// 非表示全角スペース表示用文字を NSString 型で返す
+ (NSString *)invisibleFullwidthSpaceCharacter:(NSUInteger)index

{
    unichar theUnichar = [CommonUtils invisibleFullwidthSpaceChar:index];
    
    return [NSString stringWithCharacters:&theUnichar length:1];
}



/// エンコーディング名からNSStringEncodingを返す
+ (NSStringEncoding)encodingFromName:(NSString *)encodingName

{
    NSArray *encodings = [[NSUserDefaults standardUserDefaults] arrayForKey:k_key_encodingList];
    NSStringEncoding encoding;
    BOOL isValid = NO;
    
    for (NSNumber __strong *encodingNumber in encodings) {
        CFStringEncoding cfEncoding = [encodingNumber unsignedLongValue];
        if (cfEncoding != kCFStringEncodingInvalidId) { // = separator
            encoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding);
            if ([encodingName isEqualToString:[NSString localizedNameOfStringEncoding:encoding]]) {
                isValid = YES;
                break;
            }
        }
    }
    return (isValid) ? encoding : NSNotFound;
}



/// エンコーディング名からNSStringEncodingを返す
+ (BOOL)isInvalidYenEncoding:(NSStringEncoding)encoding

{
    return [invalidYenEncodings containsObject:@(encoding)];
}



/// 文字列からキーボードショートカット定義を読み取る
+ (NSString *)keyEquivalentAndModifierMask:(NSUInteger *)modifierMask fromString:(NSString *)string includingCommandKey:(BOOL)needsIncludingCommandKey
//------------------------------------------------------
{
    *modifierMask = 0;
    NSUInteger length = [string length];
    
    if (length < 2) { return @""; }
    
    NSString *key = [string substringFromIndex:(length - 1)];
    NSCharacterSet *modCharSet = [NSCharacterSet characterSetWithCharactersInString:[string substringToIndex:(length - 1)]];
    
    if ([modCharSet characterIsMember:k_keySpecCharList[CEControlKeyIndex]]) {
        *modifierMask |= NSControlKeyMask;
    }
    if ([modCharSet characterIsMember:k_keySpecCharList[CEAlternateKeyIndex]]) {
        *modifierMask |= NSAlternateKeyMask;
    }
    if (([modCharSet characterIsMember:k_keySpecCharList[CEShiftKeyIndex]]) ||  // $
        (isupper([key characterAtIndex:0]) == 1))
    {
        *modifierMask |= NSShiftKeyMask;
    }
    if ([modCharSet characterIsMember:k_keySpecCharList[CECommandKeyIndex]]) {
        *modifierMask |= NSCommandKeyMask;
    }
    
    if (needsIncludingCommandKey && !(*modifierMask & NSCommandKeyMask)) {
        *modifierMask = 0;
        return @"";
    }
    
    return (*modifierMask != 0) ? key : @"";
}

@end
