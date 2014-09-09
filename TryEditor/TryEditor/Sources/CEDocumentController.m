/*

 BaseDocumentController
 
 TryEditor
 http://TryEditor.github.io
 
 Created on 2004-12-14 by nakamuxu
 encoding="UTF-8"
 ------------------------------------------------------------------------------
 
 © 2004-2007 nakamuxu
 © 2014 TryEditor Project
 
 This program is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License as published by the Free Software
 Foundation; either version 2 of the License, or (at your option) any later
 version.
 
 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License along with
 this program; if not, write to the Free Software Foundation, Inc., 59 Temple
 Place - Suite 330, Boston, MA  02111-1307, USA.
 

 */

#import "BaseDocumentController.h"
#import "AppDelegate.h"
#import "constants.h"


@interface BaseDocumentController ()

@property (nonatomic) BOOL showsHiddenFiles;

@property (nonatomic) IBOutlet NSView *openPanelAccessoryView;
@property (nonatomic) IBOutlet NSPopUpButton *accessoryEncodingMenu;

@end




#pragma mark -

@implementation BaseDocumentController

#pragma mark NSDocumentController Methods

//=======================================================
// NSDocumentController Methods
//
//=======================================================


/// inizialize instance
- (instancetype)init

{
    self = [super init];
    if (self) {
        [NSBundle loadNibNamed:@"OpenDocumentAccessory" owner:self];
        
        // ファイルを開くデフォルトエンコーディングをセット
        [self setSelectAccessoryEncodingMenuToDefault:self];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(buildEncodingPopupButton:)
                                                     name:CEEncodingListDidUpdateNotification
                                                   object:nil];
    }
    return self;
}



/// オープンパネルを開くときにエンコーディング指定メニューを付加する
- (NSInteger)runModalOpenPanel:(NSOpenPanel *)openPanel forTypes:(NSArray *)extensions

{
    // エンコーディングメニューの選択を初期化し、ビューをセット
    [self setSelectAccessoryEncodingMenuToDefault:self];
    [openPanel setAccessoryView:[self openPanelAccessoryView]];

    // 非表示ファイルも表示するとき
    if ([self showsHiddenFiles]) {
        [openPanel setTreatsFilePackagesAsDirectories:YES];
        [openPanel setShowsHiddenFiles:YES];
    } else {
        [openPanel setTreatsFilePackagesAsDirectories:NO];
    }

    return [super runModalOpenPanel:openPanel forTypes:extensions];
}



#pragma mark Action Messages

//=======================================================
// Action messages
//
//=======================================================


/// ドキュメントを開く (override)
- (IBAction)openDocument:(id)sender

{
    [self setShowsHiddenFiles:([sender tag] == CEOpenHiddenMenuItemTag)];

    [super openDocument:sender];
    // エンコーディングメニューの選択をリセット
    [self setSelectAccessoryEncodingMenuToDefault:self];
}



/// ドキュメントを開く
- (IBAction)openHiddenDocument:(id)sender

{
    [self setShowsHiddenFiles:([sender tag] == CEOpenHiddenMenuItemTag)];

    [super openDocument:sender];
}



/// エンコーディングメニューの選択を初期化
- (IBAction)setSelectAccessoryEncodingMenuToDefault:(id)sender

{
    NSStringEncoding defaultEncoding = (NSStringEncoding)[[NSUserDefaults standardUserDefaults] integerForKey:k_key_encodingInOpen];

    [self setAccessorySelectedEncoding:defaultEncoding];
}



#pragma mark Private Methods


/// オープンパネルのエンコーディングメニューを再構築
- (void)buildEncodingPopupButton:(NSNotification *)notification

{
    NSArray *items = [[NSArray alloc] initWithArray:[(CEAppDelegate *)[NSApp delegate] encodingMenuItems] copyItems:YES];
    
    [[self accessoryEncodingMenu] removeAllItems];
    
    [[self accessoryEncodingMenu] addItemWithTitle:NSLocalizedString(@"Auto-Detect", nil)];
    [[[self accessoryEncodingMenu] itemAtIndex:0] setTag:k_autoDetectEncodingMenuTag];
    [[[self accessoryEncodingMenu] menu] addItem:[NSMenuItem separatorItem]];
    
    for (NSMenuItem *item in items) {
        [[[self accessoryEncodingMenu] menu] addItem:item];
    }
    
}

@end
