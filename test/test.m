
#include "test.h"

@implementation test

- (id)specifiers {
	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}
	return _specifiers;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:1.0f green:0.1f blue:0.1f alpha:1];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithRed:0.21 green:0.21 blue:0.31 alpha:1.0];
        self.hb_appearanceSettings = appearanceSettings;
        self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" 
                                    style:UIBarButtonItemStylePlain
                                    target:self 
                                    action:@selector(respring:)];
        self.respringButton.tintColor = [UIColor redColor];
        self.navigationItem.rightBarButtonItem = self.respringButton;
    }

    return self;
}

-(void) contactMethod
{
UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Twitter ID" message:@"sugi.uta @uta_sugi" delegate:self cancelButtonTitle:@"Open Twitter" otherButtonTitles:nil];
[alert1 show];
}

-(void)alertView:(UIAlertView *)alertView  clickedButtonAtIndex:(NSInteger)buttonIndex {
NSString *button = [alertView buttonTitleAtIndex:buttonIndex];

if([button isEqualToString:@"Open Twitter"])
{//Open Twitterボタンを押した場合の対応
[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://mobile.twitter.com/uta_sugi"]];
}
}

- (void)respring:(id)sender {

UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
                view = view.presentedViewController;
        }
    UIAlertController *alertController = 
    [UIAlertController alertControllerWithTitle:@"Confirmation" 
                                        message:@"Do you want to respring?" 
                                 preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" 
                                                        style:UIAlertActionStyleDefault 
                                                      handler:^(UIAlertAction *action) {
            NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
    [t launch];                                                    
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"No" 
                                                        style:UIAlertActionStyleDefault 
                                                      handler:^(UIAlertAction *action) {
        //??                                                     
    }]];
    [view presentViewController:alertController animated:YES completion:nil];

}


-(void)github {
		 	 			[[UIApplication sharedApplication]
		 	 			openURL:[NSURL URLWithString:@"https://github.com/sugiuta/tutorial"]
		 	 			options:@{}
		 	 			completionHandler:nil];
		 	 				}

-(void)paypal {
		 	 			[[UIApplication sharedApplication]
		 	 			openURL:[NSURL URLWithString:@"https://www.paypal.me/sugiuta1203"]
		 	 			options:@{}
		 	 			completionHandler:nil];
		 	 				}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

    [self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
    self.navigationController.navigationController.navigationBar.translucent = YES;
}


-(void)showExplanation:(UIAlertController *)expController {

expController = [UIAlertController alertControllerWithTitle:@"test" message:@"As of right now to make test work in You’ll need to install libcolorpicker." preferredStyle:UIAlertControllerStyleAlert];
                          UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

UIAlertAction *installAction = [UIAlertAction actionWithTitle:@"Install libcolorpicker" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://url/https://cydia.saurik.com/package/org.thebigboss.libcolorpicker/"] options:@{} completionHandler:nil];
}];
    

   [expController addAction: installAction];
     [expController addAction:alertAction];

                          [self presentViewController:expController animated:YES completion:nil];

}


@end
