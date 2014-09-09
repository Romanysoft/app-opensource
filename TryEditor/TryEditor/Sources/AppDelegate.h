
@import Cocoa;


@interface CEAppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, nonatomic, copy) NSArray *encodingMenuItems;


// Public method
- (void)buildEncodingMenuItems;

@end
