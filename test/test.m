
#include "test.h"

@implementation test

-(id)specifiers {
	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}
	return _specifiers;
}

-(instancetype)init {
    self = [super init];

    if (self) {
self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" 
                                    style:UIBarButtonItemStylePlain
target:self
action:@selector(respring:)];

self.navigationItem.rightBarButtonItem = self.respringButton;
    }

    return self;
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
