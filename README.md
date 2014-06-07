###SCWeiboManager

A block style weibo manager build on top of official [Sina Weibo SDK](https://github.com/sinaweibosdk/weibo_ios_sdk) to provide easy way to authorize and make http request.

####Feature
 * All response & weibo delegate are handled in SCWeiboManager.m to keep your code tidy & clean.
 * Access Token persistent stored with keychain
 * Easily create your own request according to official API docs.
 * Besides, all features of original SDK are also available.

####Third Parties
 * [weibo_ios_sdk](https://github.com/sinaweibosdk/weibo_ios_sdk)
 * [JSONKit](https://github.com/johnezang/JSONKit)
 * [FXKeychain](https://github.com/nicklockwood/FXKeychain)

####Usage
 * Copy to your project
 * Add weibo URL scheme to both info.plist & application:openURL:sourceApplication:annotation:
 * filling your appKey

#####notice:
 * Weibo scheme delegate should always be handled with SCWeiboManager
  ```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([url.scheme isEqualToString:@""]) {
        return [WeiboSDK handleOpenURL:url delegate:[SCWeiboManager manager]];
    }

    return YES;
}
  ```
 * register app will be done when creating SCWeiboManager. (you can pre register with [WeiboSDK registerApp:] on your needs);


####Example

  Authorize:
  ```
    [[SCWeiboManager manager] authorizeToWeiboSuccess:^(WBBaseResponse *response) {
        NSLog(@"success");
    } failure:^(NSError *error) {
        NSLog(@"failed");
    }];

  ```

  Send Weibo with image
  ```
    [[SCWeiboManager manager] sendWeiboWithText:@"hahahah" image:image Success:^(NSDictionary *responseDict) {
        NSLog(@"success:\n%@", responseDict);
    } failure:^(NSError *error) {
        NSLog(@"failure:\n%@", [error description]);
    }];
  ```

####License

MIT
