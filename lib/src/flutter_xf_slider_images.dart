import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'slider_page_indicator.dart';

/// Network-image carousel built on [CarouselSlider], with optional page dots.
class FlutterXfSliderImages extends StatefulWidget {
  const FlutterXfSliderImages({
    super.key,
    required this.items,
    this.height = 200,
    this.aspectRatio = 16 / 9,
    this.initialPage = 0,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.viewportFraction = 0.85,
    this.enlargeCenterPage = true,
    this.enableInfiniteScroll = true,
    this.borderRadius = 12,
    this.showIndicator = true,
    this.indicatorActiveColor,
    this.indicatorInactiveColor,
    this.imageFit = BoxFit.cover,
    this.onPageChanged,
    this.onItemTap,
  });

  /// Image URLs to display.
  final List<String> items;

  /// Carousel viewport height. Indicator dots scale from this value.
  final double height;

  /// Used when [height] is not applied by [CarouselOptions].
  final double aspectRatio;

  final int initialPage;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;
  final double viewportFraction;
  final bool enlargeCenterPage;
  final bool enableInfiniteScroll;
  final double borderRadius;
  final bool showIndicator;
  final Color? indicatorActiveColor;
  final Color? indicatorInactiveColor;
  final BoxFit imageFit;
  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int>? onItemTap;

  @override
  State<FlutterXfSliderImages> createState() => _FlutterXfSliderImagesState();
}

class _FlutterXfSliderImagesState extends State<FlutterXfSliderImages> {
  late final CarouselSliderController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _controller = CarouselSliderController();
    _currentIndex = _safeInitialPage();
  }

  @override
  void didUpdateWidget(covariant FlutterXfSliderImages oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items.length != widget.items.length ||
        oldWidget.initialPage != widget.initialPage) {
      _currentIndex = _safeInitialPage();
    }
  }

  int _safeInitialPage() {
    if (widget.items.isEmpty) {
      return 0;
    }
    return widget.initialPage.clamp(0, widget.items.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return SizedBox(height: widget.height);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: widget.items.length,
          itemBuilder: (context, index, realIndex) {
            return _SliderImageCard(
              url: widget.items[index],
              height: widget.height,
              borderRadius: widget.borderRadius,
              fit: widget.imageFit,
              onTap: widget.onItemTap == null
                  ? null
                  : () => widget.onItemTap!(index),
            );
          },
          options: CarouselOptions(
            height: widget.height,
            aspectRatio: widget.aspectRatio,
            initialPage: _safeInitialPage(),
            autoPlay: widget.autoPlay && widget.items.length > 1,
            autoPlayInterval: widget.autoPlayInterval,
            autoPlayAnimationDuration: widget.autoPlayAnimationDuration,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: widget.enlargeCenterPage,
            viewportFraction: widget.viewportFraction,
            enableInfiniteScroll:
                widget.enableInfiniteScroll && widget.items.length > 1,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
              widget.onPageChanged?.call(index);
            },
          ),
        ),
        if (widget.showIndicator)
          SliderPageIndicator(
            count: widget.items.length,
            currentIndex: _currentIndex,
            carouselHeight: widget.height,
            activeColor: widget.indicatorActiveColor,
            inactiveColor: widget.indicatorInactiveColor,
            onDotTap: (index) => _controller.animateToPage(index),
          ),
      ],
    );
  }
}

class _SliderImageCard extends StatelessWidget {
  const _SliderImageCard({
    required this.url,
    required this.height,
    required this.borderRadius,
    required this.fit,
    this.onTap,
  });

  final String url;
  final double height;
  final double borderRadius;
  final BoxFit fit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Material(
        elevation: 3,
        shadowColor: Colors.black26,
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Image.network(
            url,
            height: height,
            width: double.infinity,
            fit: fit,
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }
              return ColoredBox(
                color: theme.colorScheme.surfaceContainerHighest,
                child: const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return ColoredBox(
                color: theme.colorScheme.surfaceContainerHighest,
                child: Icon(
                  Icons.broken_image_outlined,
                  size: 36,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
