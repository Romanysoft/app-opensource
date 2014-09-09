
@import Cocoa;


@interface CEKeyBindingManager : NSObject

// class method
+ (instancetype)sharedManager;

+ (NSString *)keySpecCharsFromKeyEquivalent:(NSString *)string modifierFrags:(NSUInteger)modifierFlags;
+ (NSString *)printableKeyStringFromKeySpecChars:(NSString *)string;


// Public method
- (void)setupAtLaunching;
- (NSString *)selectorStringWithKeyEquivalent:(NSString *)string modifierFrags:(NSUInteger)modifierFlags;

- (BOOL)usesDefaultMenuKeyBindings;
- (NSMutableArray *)textKeySpecCharArrayForOutlineDataWithFactoryDefaults:(BOOL)usesFactoryDefaults;
- (NSMutableArray *)mainMenuArrayForOutlineData:(NSMenu *)menu;
- (NSString *)keySpecCharsInDefaultDictionaryFromSelectorString:(NSString *)selectorString;
- (BOOL)saveMenuKeyBindings:(NSArray *)outlineViewData;
- (BOOL)saveTextKeyBindings:(NSArray *)outlineViewData texts:(NSArray *)texts;

@end
