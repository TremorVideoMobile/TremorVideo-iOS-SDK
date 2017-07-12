# TremorVideo-iOS-SDK

- SDK Version: 3.14.1
- Release Date: July 12, 2017
- Relesee Notes: Please visit [iOS SDK Releases Notes](https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK/wiki/iOS-SDK-Release-Notes) to check details of each iOS SDK release.

# To Download
Please [contact the publisher team](mailto: PublisherManagement@Tremorvideo.com) at Tremor Video to download the latest SDK. 

# New in SDK 3.14.1
- IAS Ad viewability measurements are now included. Video 360 support.

# OS Support (ios 8 and above)
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
- This project also includes a sample which demostrates how to integrate the iOS SDK into your application.

# SDK Integration through mediation
Tremor supports iOS mediation including FreeWheel, Google AdMob/DFP, Fyber, Mopub (as a custom network). [iOS SDK Mediation](https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK/wiki/iOS-SDK-Mediation) contains all the details on how to integrate Tremor SDK through the mediaitons. If you integrate Tremor SDK through mediation, you should always go through this documentation to know the requirements to configure your applicaton in order to use Tremor SDK.
