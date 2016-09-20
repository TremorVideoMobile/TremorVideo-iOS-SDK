# TremorVideo-iOS-SDK

- SDK Version: 3.13
- Release Date: September 12, 2016
- Relesee Notes: Please visit [iOS SDK Releases Notes](https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK/wiki/iOS-SDK-Release-Notes) to check details of each iOS SDK release.)

# To Download
Please [contact the publisher team](mailto: PublisherManagement@Tremorvideo.com) at Tremor Video to download the latest SDK. SDK 3.13 contains
- TremorVideoAd.framework
- Tremor Video iOS SDK.pdf (SDK integration documentation)
- sample (a sample app)

# New in SDK 3.13.0
- Fully tested for iOS 10
- Internal urls are now HTTPS, in preparation to be ATS compliant.
- Bug fixes

# OS Support and iOS 10
- iOS 7 is the minimum OS version supported iOS release
- In iOS 9 and 10, App Transport Security (ATS) is the default setting, which requires apps to make
network calls only over SSL. We are working with our partners to facilitate the transition to support this change to ensure compliance. In the meantime, if you want to release apps that support iOS 9/10, you will need to disable ATS in order to ensure everything continues to work as expected. To do so, just add the following to the plist of your apps:
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
- Add 'NSPhotoLibraryUsageDescription' to your plist to allow users to save images from ads.

# Orientation
Tremor SDK requires applications to support all orientations, both portrait and landscape. If your application does not support landscape mode, you should ensure the UI in your application is portrait only. Here is an example (for iOS 6 and later):
- In your application’s `UIViewController(s)`
- Implement the method `- (NSUInteger)supportedInterfaceOrientations`
- Set return value `UIInterfaceOrientationMaskPortrait` or `UIInterfaceOrientationMaskPortraitUpsideDown`

# SDK Integration
- If you have already integrated Tremor iOS SDK in your applications, please review [Update from Earlier Versions](https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK/wiki/Updating-from-Earlier-Versions) to update your SDK to the latest SDK.
- If you are new users of Tremor iOS SDK, please review [iOS Library Integration] (https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK/wiki/iOS-Library-Integration) which contains detailed integration instructions.
- [Tremor Video iOS API Doc] (http://tremorvideomobile.github.io/iOS) contains details about each API definitions.
- This project also includes a sample which demostrates how to integration iOS SDK into your application.

# SDK Integration through mediation
Tremor supports iOS mediation including FreeWheel, Google AdMob/DFP, Fyber, Mopub (as a custom network). [iOS SDK Mediation](https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK/wiki/iOS-SDK-Mediation) contains all the details on how to integrate Tremor SDK through the mediaitons. If you integrate Tremor SDK through mediation, you should always go through this documentation to know the requirements to configure your applicaton in order to use Tremor SDK.
