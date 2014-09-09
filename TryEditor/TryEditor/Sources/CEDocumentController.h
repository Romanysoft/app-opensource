
@import Cocoa;
#import "BaseDocument.h"


@interface BaseDocumentController : NSDocumentController

@property (nonatomic) NSStringEncoding accessorySelectedEncoding;

// Action Message
- (IBAction)openHiddenDocument:(id)sender;
- (IBAction)setSelectAccessoryEncodingMenuToDefault:(id)sender;

@end
