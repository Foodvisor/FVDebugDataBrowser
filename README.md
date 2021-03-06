# FVDebugDataBrowser

[![Version](https://img.shields.io/cocoapods/v/FVDebugDataBrowser.svg?style=flat)](https://cocoapods.org/pods/FVDebugDataBrowser)
[![License](https://img.shields.io/cocoapods/l/FVDebugDataBrowser.svg?style=flat)](https://cocoapods.org/pods/FVDebugDataBrowser)
[![Platform](https://img.shields.io/cocoapods/p/FVDebugDataBrowser.svg?style=flat)](https://cocoapods.org/pods/FVDebugDataBrowser)

![alt tag](https://raw.githubusercontent.com/foodvisor/FVDebugDataBrowser/master/demo.gif)

FVDebugDataBrowser is a dev/debug tool that allows you to read the content inside an app

## Requirements
- iOS 8.0+
- Xcode 8.3+
- Swift 3.2+

## Installation

FVDebugDataBrowser is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'FVDebugDataBrowser'
```

## Features

- [x] Userdefault
- [x] Core-Data
- [x] Custom Events
- [ ] Network

## Usage
Setup debugger (in AppDelegate for example)
``` swift
    FVDebugDataBrowser.setup()
```
To add Core Data
``` swift
    FVDebugDataBrowser.addPersistenceContainer("CoreDataDbName")
```
To log custom Events
``` swift
    FVDebugDataBrowser.logEvent("UserDidClickOnButton", value: "event")
```
Display the debugger
``` swift
    FVDebugDataBrowser.display()
```


## Author

Foodvisor, contact@foodvisor.io

## License

FVDebugDataBrowser is available under the MIT license. See the LICENSE file for more info.
