

@import Cocoa;
#import "NSString+ComposedCharacter.h"


@interface CEGlyphPopoverController : NSViewController

/// default initializer (singleString must be a single character (or a surrogate-pair). If not, return nil.)
- (instancetype)initWithCharacter:(NSString *)singleString;

/// show popover
- (void)showPopoverRelativeToRect:(NSRect)positioningRect ofView:(NSView *)parentView;

@end
