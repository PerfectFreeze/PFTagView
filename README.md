# PFTagView

Just a tag view like the wordpress tag-cloud.

## Screenshot

![Screenshot](Screenshot.png)

## Installation

### Using Carthage

Add `PFTagView` to your `Cartfile`:

```
github "PerfectFreeze/PFTagView"
```

Run `carthage` to build this framework. 

Add `PFTagView.framework` to your Xcode project.

### Using CocoaPods

Add `PFTagView` to your `Podfile`:

```ruby
pod 'PFTagView'
```

Run `pod install` to install this framework.

### Manually

Drag `Classes` folder to your project.

## Usage 

### Get Started

```objective-c
#import 'PFTagView.h'

...

	// where you want to load this tag view
	PFTagViewConfiguration *config = [PFTagViewConfiguration new];
	PFTagView *view = [[PFTagView alloc] initWithFrame:frame
                                                  dict:dict
                                                config:config];
...

@end

```

### Configuration

```objective-c
#import 'PFTagView.h'

...

	// where you want to load this tag view
	PFTagViewConfiguration *config = [PFTagViewConfiguration new];
	config.tagViewCountLabelTextColor = [UIColor blueColor];
    config.tagViewCountLabelFontSize = 8.f;
    config.tagViewMainTextColor = [UIColor redColor];
    config.maxFontSize = 24.f;
    config.minFontSize = 10.f;
    config.tagViewHeight = 30.f;
    config.tagViewMargin = 10.f;
    PFTagView *view = [[PFTagView alloc] initWithFrame:frame
                                                  dict:dict
                                                config:config];
...

@end

```

## License

This project is released under the terms and conditions of the [MIT license](https://opensource.org/licenses/MIT). See [LICENSE](LICENSE) for details.
