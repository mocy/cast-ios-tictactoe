// Copyright 2013 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "AppDelegate.h"

#import <GCKFramework/GCKFramework.h>

static NSString *const kUserDefaultsKeyUserName = @"kUserDefaultsKeyUserName";

@interface AppDelegate ()

@property(nonatomic, strong, readwrite) GCKContext *context;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
    
        // Only valid on iOS 7+
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.451f green:0.753f blue:0.341f alpha:1.000f]];
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithWhite:1.0 alpha:0.8f]];
        
        
        // Change the font style of the title
         [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
         [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
        
         [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
    self.context = [[GCKContext alloc] initWithUserAgent:@"TicTacToe"];
    self.deviceManager = [[GCKDeviceManager alloc] initWithContext:self.context];

    return YES;
}

- (NSString *)userName {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  return [userDefaults stringForKey:kUserDefaultsKeyUserName];
}

- (void)setUserName:(NSString *)userName {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setValue:userName forKey:kUserDefaultsKeyUserName];
}

@end
