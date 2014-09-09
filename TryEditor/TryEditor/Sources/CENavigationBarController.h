/*

 CENavigationBarController
 
 TryEditor
 http://TryEditor.github.io
 
 Created on 2005-08-22 by nakamuxu
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

@import AppKit;


@interface CENavigationBarController : NSViewController

@property (nonatomic, unsafe_unretained) NSTextView *textView;
@property (nonatomic) BOOL showsNavigationBar;


// Public method
- (void)setOutlineMenuArray:(NSArray *)outlineItems;
- (void)selectOutlineMenuItemWithRange:(NSRange)range;
- (void)updatePrevNextButtonEnabled;
- (BOOL)canSelectPrevItem;
- (BOOL)canSelectNextItem;
- (void)showOutlineIndicator;

- (void)setCloseSplitButtonEnabled:(BOOL)enabled;
- (void)setSplitOrientationVertical:(BOOL)isVertical;


// action messages
- (IBAction)selectPrevItem:(id)sender;
- (IBAction)selectNextItem:(id)sender;

@end
