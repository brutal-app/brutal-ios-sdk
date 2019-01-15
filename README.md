# Brutal

Automatic user research for startups.
Brutal allows any company to be automatically collecting and analysing qualitative user feedback.
Discover the why behind your data and start making confident product decisions.

## Requirements

- iOS 9.0+
- Xcode 10.1+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Brutal', :git => 'https://github.com/tiagomartinho/brutal-ios-sdk'
```

Then, run the following command:

```bash
$ pod install
```

## Initialize the SDK

1) In your AppDelegate import the SDK:

```swift
import Brutal
```

2) Setup the SDK in applicationDidFinishLaunchingWithOptions:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    BrutalSDK.setup()
    return true
}
```
