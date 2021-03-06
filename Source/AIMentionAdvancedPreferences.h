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

#import <Adium/AIAdvancedPreferencePane.h>

#define PREF_KEY_MENTIONS		@"Saved Mentions"

@interface AIMentionAdvancedPreferences : AIAdvancedPreferencePane {
	IBOutlet		NSTextField			*label_explanation;
	
	IBOutlet		NSTableView			*tableView;
	IBOutlet		NSButton			*button_add;
	IBOutlet		NSButton			*button_remove;
	
	NSMutableArray						*mentionTerms;
}


- (IBAction)add:(id)sender;
- (IBAction)remove:(id)sender;
@end
