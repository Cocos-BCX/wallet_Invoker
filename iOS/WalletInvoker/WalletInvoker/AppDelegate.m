//
//  AppDelegate.m
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/6.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import "AppDelegate.h"
#import "CocosWalletApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [CocosWalletApi registerAppID:@"dappdemo"];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [CocosWalletApi handleURL:url options:options result:^(CocosResponseObj * _Nonnull respObj) {
        NSLog(@"%@",respObj.action);
        
        NSString *JSONString = [self JSONString:respObj.data];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:respObj.message message:JSONString preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }];
}

- (NSString *)JSONString:(id)obj {
    if ([NSJSONSerialization isValidJSONObject:obj]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:nil];
        if (data) {
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    return nil;
}

@end
