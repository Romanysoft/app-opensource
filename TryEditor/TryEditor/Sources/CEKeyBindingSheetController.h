

@import Cocoa;


typedef NS_ENUM(NSUInteger, CEKeyBindingType) {
    CEMenuKeyBindingsType,
    CETextKeyBindingsType,
};


@class CEKeyBindingSheet;


@interface CEKeyBindingSheetController : NSWindowController <NSWindowDelegate>

- (instancetype)initWithMode:(CEKeyBindingType)mode;

@end
