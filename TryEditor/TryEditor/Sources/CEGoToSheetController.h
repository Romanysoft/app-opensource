

@import AppKit;
#import "BaseDocument.h"


@interface CEGoToSheetController : NSWindowController <NSWindowDelegate>

- (void)beginSheetForDocument:(BaseDocument *)document;

@end
