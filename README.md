# TremorVideo-iOS-SDK
SDK Version: 3.12.0

# To Download
Please contact the publisher team at Tremor Video to download the latest SDK. SDK 3.12 contains
- TremorVideoAd.framework
- Tremor Video iOS SDk.pdf (SDK integration documentation)
- sample (a sample app)

# New in SDK 3.12.0
- Tremor Video’s SDK is provided as a framework. Please follow upgrade note below to update installation of the Tremor SDK
- New ad formats are added. Integrating this SDK will help improving your fill rate.
- Fixed an ad rendering bug when split screen is enabled in iOS 9 + iPad
- Improved logging
- Bug fixes

# Updating your SDK to v3.12.0 from earlier version
## Upgrading to SDK 3.12.0 from SDK 3.10.x and 3.11.x
In SDK 3.11 below, Tremor iOS SDK was provided as a static library. In SDK v3.12.0, Tremor Video’s SDK is provided as a framework. Here are two steps for you the upgrade to SDK 3.12.0 to use the new framework.

1. Remove the static libary libTremorVideoAd.a and header file TremorVideoAd.h
2. Include the “TremorVideoAd.framework” in the Xcode project and add it to your targets under “Link Binary with Libraries”. Make sure “Framework Search Paths” includes the path to this framework.

## Additional Steps for upgrading from earlier SDK (v3.9.1 and below)
Replace the TremorVideo folder in your existing project with the TremorVideo framework included in the Tremor Video 3.12 SDK. Most of previous API functions are preserved. However, if you’re upgrading from v3.9.1 or below, the following code changes are required:

- Remove the call ```[TremorVideoAd start];```
- Every time you want to show an ad:
  - Fetchanadbycalling ```[TremorVideoAdloadAd]```;
  - Call```[TremorVideoAdshowAd];``` to show a video ad

Because there is an expiration time for each ad, we recommend you call showAd shortly after the ad is ready. Implement ```TremorVideoAdDelegate```’s adReady callback to be notified when an ad is ready.
