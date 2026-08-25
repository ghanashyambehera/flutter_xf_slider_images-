# flutter_xf_slider_images

A Flutter image carousel widget built on [`carousel_slider`](https://pub.dev/packages/carousel_slider). Pass a list of image URLs and get auto-play, a peek of neighboring slides, and page dots sized from the carousel height.

## Preview

<p align="center">
  <img src="screenshots/example_slider.png" alt="Example app: image carousel with page dots" width="320">
</p>

## Features

### 0.0.1

- Network image carousel wrapping `carousel_slider`
- Auto-play for multiple slides

### 0.0.2

- Center slide enlarged, with side images partially visible
- Page dots below the slider (one per image); size scales with `height`
- Tap a dot to jump to that slide
- Rounded cards, loading spinner, and a broken-image fallback
- Optional `onPageChanged` and `onItemTap` callbacks
- Safer API (`items`, `height`) and empty-list handling

See [CHANGELOG.md](CHANGELOG.md) for the full version history.

## Supported platforms

- Android
- iOS
- Web
- Desktop (macOS, Windows, Linux)

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_xf_slider_images: ^0.0.2
```

Then import it:

```dart
import 'package:flutter_xf_slider_images/flutter_xf_slider_images.dart';
```

For a local path (this repo / the example app):

```yaml
dependencies:
  flutter_xf_slider_images:
    path: ../
```

## Usage

```dart
FlutterXfSliderImages(
  items: const [
    'https://example.com/banner-1.jpg',
    'https://example.com/banner-2.jpg',
    'https://example.com/banner-3.jpg',
  ],
  height: 200,
)
```

### Customized example

```dart
FlutterXfSliderImages(
  items: images,
  height: 200,
  autoPlay: true,
  viewportFraction: 0.85,
  enlargeCenterPage: true,
  showIndicator: true,
  borderRadius: 12,
  onPageChanged: (index) {
    // current slide
  },
  onItemTap: (index) {
    // tapped image
  },
)
```

A full demo lives in [`example/lib/main.dart`](example/lib/main.dart). From the `example` directory:

```bash
flutter run
```

## Parameters

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `List<String>` | required | Image URLs to show. |
| `height` | `double` | `200` | Carousel height. Indicator dots scale from this value. |
| `aspectRatio` | `double` | `16 / 9` | Aspect ratio used by the carousel options. |
| `initialPage` | `int` | `0` | Starting slide index. |
| `autoPlay` | `bool` | `true` | Auto-advance when there is more than one image. |
| `autoPlayInterval` | `Duration` | `3s` | Time between auto-play transitions. |
| `autoPlayAnimationDuration` | `Duration` | `800ms` | Animation length for each transition. |
| `viewportFraction` | `double` | `0.85` | Fraction of the viewport each slide occupies. |
| `enlargeCenterPage` | `bool` | `true` | Enlarge the centered slide. |
| `enableInfiniteScroll` | `bool` | `true` | Loop slides when there is more than one image. |
| `borderRadius` | `double` | `12` | Corner radius of each image card. |
| `showIndicator` | `bool` | `true` | Show dots under the carousel. |
| `indicatorActiveColor` | `Color?` | theme primary | Color of the active (wider) dot. |
| `indicatorInactiveColor` | `Color?` | on-surface, 28% | Color of inactive dots. |
| `imageFit` | `BoxFit` | `BoxFit.cover` | How each network image is fitted. |
| `onPageChanged` | `ValueChanged<int>?` | `null` | Called when the current slide changes. |
| `onItemTap` | `ValueChanged<int>?` | `null` | Called when a slide is tapped. |

## License

[GPL-3.0](LICENSE)
