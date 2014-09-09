/*

 CommonUtils
 

 

 */

@import Foundation;


@interface CommonUtils : NSObject

/// 非表示半角スペース表示用文字を返す
+ (unichar)invisibleSpaceChar:(NSUInteger)index;
+ (NSString *)invisibleSpaceCharacter:(NSUInteger)index;

/// 非表示タブ表示用文字を返す
+ (unichar)invisibleTabChar:(NSUInteger)index;
+ (NSString *)invisibleTabCharacter:(NSUInteger)index;

/// 非表示改行表示用文字を返す
+ (unichar)invisibleNewLineChar:(NSUInteger)index;
+ (NSString *)invisibleNewLineCharacter:(NSUInteger)index;

/// 非表示全角スペース表示用文字を返す
+ (unichar)invisibleFullwidthSpaceChar:(NSUInteger)index;
+ (NSString *)invisibleFullwidthSpaceCharacter:(NSUInteger)index;

/// エンコーディング名からNSStringEncodingを返す
+ (NSStringEncoding)encodingFromName:(NSString *)encodingName;

/// エンコーディング名からNSStringEncodingを返す
+ (BOOL)isInvalidYenEncoding:(NSStringEncoding)encoding;

/// 文字列からキーボードショートカット定義を読み取る
+ (NSString *)keyEquivalentAndModifierMask:(NSUInteger *)modifierMask
                                fromString:(NSString *)string
                       includingCommandKey:(BOOL)needsIncludingCommandKey;

@end
