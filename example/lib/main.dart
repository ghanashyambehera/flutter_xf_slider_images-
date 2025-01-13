import 'package:flutter/material.dart';
import 'package:flutter_xf_slider_images/flutter_xf_slider_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> images = [
    'https://img.freepik.com/free-vector/flat-design-pizza-sale-banner_23-2149116013.jpg',
    'https://blog.lisi.menu/wp-content/uploads/2023/08/Food-Banner.jpg',
    'https://img.freepik.com/free-vector/flat-design-pizza-sale-banner_23-2149116013.jpg',
    'https://blog.lisi.menu/wp-content/uploads/2023/08/Food-Banner.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/007/420/763/small_2x/social-media-food-banner-design-free-vector.jpg',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: FlutterXfSliderImages(
            items: images,
            height: 200,
          )),
    );
  }
}
