/* 
 * Adium is the legal property of its developers, whose names are listed in the copyright file included
 * with this source distribution.
 * 
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation; either version 2 of the License,
 * or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program; if not,
 * write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#import "AIAdvancedPreferencePane.h"
#import "AIAccountMenu.h"

@interface ESOTRPreferences : AIAdvancedPreferencePane <AIAccountMenuDelegate, NSTableViewDelegate, NSTableViewDataSource> {
	IBOutlet	NSPopUpButton	*popUp_accounts;
	IBOutlet	NSButton		*button_generate;
	IBOutlet	NSTextField		*textField_privateKey;
	
	IBOutlet	NSTableView		*tableView_fingerprints;
	IBOutlet	NSButton		*button_showFingerprint;
	IBOutlet	NSButton		*button_forgetFingerprint;
	
	BOOL						viewIsOpen;
	
	NSMutableArray				*fingerprintDictArray;
	AIAccountMenu 				*accountMenu;
}

- (IBAction)generate:(id)sender;
- (IBAction)showFingerprint:(id)sender;
- (IBAction)forgetFingerprint:(id)sender;

- (void)updateFingerprintsList;
- (void)updatePrivateKeyList;

@end
