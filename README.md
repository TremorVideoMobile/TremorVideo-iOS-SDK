# TremorVideo-iOS-SDK

- SDK Version: 3.12.0
- Release Date: 3/21/2016

# To Download
Please contact the publisher team at Tremor Video to download the latest SDK. SDK 3.12 contains
- TremorVideoAd.framework
- Tremor Video iOS SDK.pdf (SDK integration documentation)
- sample (a sample app)

# New in SDK 3.12.0
- Tremor Video’s SDK is provided as a framework. Please follow SDK integration note below to update installation of the Tremor SDK
- Added new ad formats and MOAT viewability measurement. Integrating this SDK will help improving your fill rate.
- Fixed an ad rendering bug when split screen is enabled in iOS 9 + iPad
- Improved logging
- Bug fixes

# OS Support and iOS 9
- iOS 6 is the minimum OS version supported iOS release
- SDK 3.12 is compiled with bitcode
- In iOS 9, App Transport Security (ATS) is the default setting, which requires apps to make
network calls only over SSL. We are working with our partners to facilitate the transition to support this change to ensure compliance. In the meantime, if you want to release apps that support iOS 9, you will need to disable ATS in order to ensure everything continues to work as expected. To do so, just add the following to the plist of your apps:
```
        <key>NSAppTransportSecurity</key> 
        <dict>
          <key>NSAllowsArbitraryLoads</key>
          <true/>
        </dict>
```
- Add `Bundle display name` to the plist of your apps for iOS 9. For instance
```
	<key>CFBundleDisplayName</key>
	<string>Bundle Display Name</string>
```

# Orientation
Tremor SDK requires applications to support all orientations, both portrait and landscape. If your application does not support landscape mode, you should ensure the UI in your application is portrait only. Here is an example (for iOS 6 and later):
- In your application’s `UIViewController(s)`
- Implement the method `- (NSUInteger)supportedInterfaceOrientations`
- Set return value `UIInterfaceOrientationMaskPortrait` or `UIInterfaceOrientationMaskPortraitUpsideDown`

# SDK integration
- If you have already integrated Tremor iOS SDK in your applications, please review [Update from Earlier Versions](https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK/wiki/Updating-from-Earlier-Versions) to update your SDK to the latest SDK.
- If you are new users of Tremor iOS SDK, please review [iOS Library Integration] (https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK/wiki/iOS-Library-Integration) which contains detailed integration instructions.
- [Tremor Video iOS API Doc] (http://tremorvideomobile.github.io/iOS) contains details about each API definitions.
