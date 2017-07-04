# SRMCategory

[![CI Status](http://img.shields.io/travis/SongRanMark/SRMCategory.svg?style=flat)](https://travis-ci.org/SongRanMark/SRMCategory)
[![Version](https://img.shields.io/cocoapods/v/SRMCategory.svg?style=flat)](http://cocoapods.org/pods/SRMCategory)
[![License](https://img.shields.io/cocoapods/l/SRMCategory.svg?style=flat)](http://cocoapods.org/pods/SRMCategory)
[![Platform](https://img.shields.io/cocoapods/p/SRMCategory.svg?style=flat)](http://cocoapods.org/pods/SRMCategory)

SRMCategory 是一个为 iOS 开发提供通用 Category 集合的类库。对 Foundation 和 UIKit 原生库中的类提供了一些新的方法，以提高开发的效率和代码的简洁度。

## 安装

```ruby
pod "SRMCategory"
```

## 使用

### Category 列表

在相应文件中导入需要的 Category 即可使用其中的方法，每个 Category 中所包含的方法，请查阅其 .h 文件。

- Foundation

	- NSBundle(SRMExtension)
	- NSString(SRMExtension)
	- NSURL(SRMExtension)
	- NSUserDefaults(SRMExtension)

- UIKit

	- UIColor(SRMExtension)
	- UIScreen(SRMExtension)
	- UIView(SRMExtension)
	- UIView(SRMConstraint)
	- UIView(SRMFrame)
	- UIViewController(SRMExtension)

### 分类规则

初始每一个类创建的 Category 都为 SRMExtension，之后若某一主题的相关方法有很多，则会单独新建一个对应主题的分类，如 UIView(SRMConstraint)，UIView(SRMFrame)。

### 测试

所有的分类方法都通过 Example 目录下的 SRMCategory 工程进行单元测试，同时也可以通过 test case 查看分类方法如何使用。新添加的分类方法也必须配套添加对应的测试方法，以保证这些分类方法的稳定性。

## 联系我

S.R, firecrackerinlane2@gmail.com

## 授权许可

**MIT**
