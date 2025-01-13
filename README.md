# Flutter_xf_slider_images
  A flutter xf slider images widget.
  
# Description: 
  This is new Flutter xf slider images.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

The plugin project was generated without specifying the `--platforms` flag, no platforms are currently supported.
To add platforms, run `flutter create -t plugin --platforms <platforms> .` in this directory.
You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/to/pubspec-plugin-platforms.
  

## Features 

* Custom child widgets
* Auto play

## Supported platforms

* Flutter Android
* Flutter iOS
* Flutter web
* Flutter desktop
## Features

- **Automatic Scrolling**: Automatically scrolls the text with customizable speed.
- **Scrolling Modes**: Supports endless and bouncing scrolling modes.
- **Customizable Style**: Set text color, weight, alignment, and direction.
- **Faded Borders**: Optionally add faded borders on the text for a smooth transition effect.
- **Selectable Text**: Choose between selectable and non-selectable text.
- **Interval Spaces**: Define spaces between repeated text in endless mode.

Note: this page is built with flutter-web. For a better user experience, please use a mobile device to open this link.

## Installation

Add `flutter_xf_slider_images: ^1.0.0` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:flutter_xf_slider_images/flutter_xf_slider_images.dart';
```

## How to use

Simply create a `CarouselSlider` widget, and pass the required params:

```dart
FlutterXfSliderImages(
  items: images,
  height: 200,
),
```



All screenshots above can be found at the example project.

## License

MIT
