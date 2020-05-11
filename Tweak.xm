/*
 * Tweak.xm
 * Created by Sugi.uta <Twitter @uta_sugi> on 5/11/2020.
 * Copyright © 2020 Sugi.uta <Twitter @uta_sugi>. All rights reserved.
 */
#import "Tweak.h"


//Var
HBPreferences *preferences;

//Prefs
bool enabled = false;
CGFloat dockAlpha = 1.0;

//Main
%group tweak
%hook SBDockView
-(void)setBackgroundAlpha:(double)arg1 {
    %orig(arg1 * dockAlpha);
}
%end
%end


// PREFERENCES BUNDLE
void loadPrefs() {

preferences = [[HBPreferences alloc] initWithIdentifier:@"com.sugi.test"];

  [preferences registerBool:&enabled default:NO forKey:@"kEnabled"];

  [preferences registerFloat:&dockAlpha default:NO forKey:@"kDockAlpha"];

}


%ctor {


CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL,(CFNotificationCallback)loadPrefs, CFSTR("com.sugi.test/loadPrefs"), NULL,
CFNotificationSuspensionBehaviorDeliverImmediately);


loadPrefs();


if(enabled) {
   %init(tweak);
            }

}