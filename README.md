# AYPaging

[![CI Status](https://img.shields.io/travis/antonyereshchenko@gmail.com/AYPaging.svg?style=flat)](https://travis-ci.org/antonyereshchenko@gmail.com/AYPaging)
[![Version](https://img.shields.io/cocoapods/v/AYPaging.svg?style=flat)](https://cocoapods.org/pods/AYPaging)
[![License](https://img.shields.io/cocoapods/l/AYPaging.svg?style=flat)](https://cocoapods.org/pods/AYPaging)
[![Platform](https://img.shields.io/cocoapods/p/AYPaging.svg?style=flat)](https://cocoapods.org/pods/AYPaging)

<p align="center">
  <img width="64%" height="64%" src="https://github.com/bananaRanger/AYPaging/blob/master/Resources/logo.png?raw=true">
</p>

## About

AYPagingView - is a view that displays a horizontal series of stripes or dots, each of which corresponds to a page in the app’s document or other data-model entity.

## Installation

AYPaging is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
inhibit_all_warnings!

target 'YOUR_TARGET_NAME' do
  use_frameworks!
	pod 'AYPaging'
end
```

### Demo

<p align="center">
  <img width="32%" height="32%" src="https://github.com/bananaRanger/AYPaging/blob/master/Resources/demo.gif?raw=true">
</p>

## Usage


```swift
// 'count' - object of 'Int' type. Number of items.

pagingView.count = count
pagingView.cornerRadiusFactor = 2

pagingView.fillingAnimationDuration = 0.32
pagingView.scalingAnimationDuration = 0.32
pagingView.scalingAnimationFactor = 0.8

pagingView.color = .gray
pagingView.selectedColor = .white

// pagingView.isCircles = true


```

## Author

[📧](mailto:anton.yereshchenko@gmail.com?subject=[GitHub]%20Source%20AYPaging) Anton Yereshchenko

## License

AYPaging is available under the MIT license. See the LICENSE file for more info.

## Used in project

Icons & photos:

Icons8 - https://icons8.com

Unsplash - https://unsplash.com
