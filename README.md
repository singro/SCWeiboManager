SCWeiboManager
==============

A block style weibo manager build on top of official Sina Weibo SDK to provide easy way to authorize and make http request.


ThirdParties
 * [weibo_ios_sdk](https://github.com/sinaweibosdk/weibo_ios_sdk)
 * [JSONKit](https://github.com/johnezang/JSONKit)
 * [FXKeychain](https://github.com/nicklockwood/FXKeychain)

Usage
 * Copy to your project
 * Add weibo URL scheme to both info.plist & application:openURL:sourceApplication:annotation:
 * filling your appKey

Example

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
License

MIT
