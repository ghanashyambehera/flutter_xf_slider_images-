import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FlutterXfSliderImages extends StatefulWidget {
  final List<String>? items;
  final int? height;
  final double? aspectRatio;
  final int? initialPage;
  final bool? autoPlay;

  const FlutterXfSliderImages({
    super.key,
    required this.items,
    required this.height,
    this.aspectRatio = 16 / 9,
    this.initialPage = 0,
    this.autoPlay = true,
  });

  @override
  State<FlutterXfSliderImages> createState() => _FlutterXfSliderImagesState();
}

class _FlutterXfSliderImagesState extends State<FlutterXfSliderImages> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.items!.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Image.network(
          widget.items![index],
          fit: BoxFit.cover,
          height: widget.height!.toDouble(),
          width: double.infinity,
        );
      },
      options: CarouselOptions(
        height: widget.height!.toDouble(),
        aspectRatio: widget.aspectRatio!,
        initialPage: widget.initialPage!,
        autoPlay: widget.autoPlay!,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
