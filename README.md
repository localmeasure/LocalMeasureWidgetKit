[![CocoaPods](https://img.shields.io/cocoapods/v/LocalMeasureWidgetKit.svg)](https://cocoapods.org/pods/LocalMeasureWidgetKit)
[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/localmeasure)

![Local Measure](https://3h05ydjpmgg26w82hvkove2m-wpengine.netdna-ssl.com/wp-content/themes/local-measure/images/lm-logo.svg)

# Local Measure Widget Kit

Quickly and easily integrate your Local Measure widgets to your app.

---

## Features

- [x] Get a list of your widgets as an array of `LMWidget`.
- [x] Get a list of a widget's posts as an array of `LMPost`.

---

## Requirements

- iOS 8.0+
- Xcode 7.3+

---

## Get in touch

If you are a Local Measure customer and need help setting up your widget integration, please get in touch with <solal@getlocalmeasure.com>

If your are not a Local Measure client, you will find our contact page here: [getlocalmeasure.com/contact](https://www.getlocalmeasure.com/contact)

---

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build LocalMeasureWidgetKit 0.1.0+.

To integrate LocalMeasureWidgetKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'LocalMeasureWidgetKit', '~> 0.1.21'
```

Then, run the following command:

```bash
$ pod install
```

---

## Usage

### Initial setup

Start by importing the `LocalMeasureWidgetKit` module in your `AppDelegate`

```swift
import LocalMeasureWidgetKit
```

In your `func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool`, call `func setup(userHash: String)` passing your user hash as an argument.

This will store your user hash so you don't have to pass it every time you make a request to the Local Measure API.

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
  LMWidgetKit().setup("<USER_HASH>")
  return true
}
```


### Listing widgets

To get your list of widgets you simply need to call `func widgets(completion: (widgets: [LMWidget]) -> Void)` and pass it a closure to handle the result.

```swift
LMWidgetKit().widgets({ (widgets) -> Void in
  print(widgets)
})
```


### Listing a widget's posts

To list a widget's posts, call `func posts(widgetHash: String, completion: (posts: [LMPost]) -> Void)` and pass it the widget's hash and a closure to handle the result.

```swift
LMWidgetKit().posts("<WIDGET_HASH>", completion: { (posts) -> Void in
  print(posts)
})
```

---

## Detailed documentation

A detailed documentation of the `LMWidgetKit` class and the module's types can be found here. (work in progress)