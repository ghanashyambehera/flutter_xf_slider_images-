import 'package:flutter/material.dart';
import 'package:flutter_xf_slider_images/flutter_xf_slider_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plugin example app',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF5B67CA),
        useMaterial3: true,
      ),
      home: const _ExampleHome(),
    );
  }
}

class _ExampleHome extends StatelessWidget {
  const _ExampleHome();

  static const List<String> _images = [
    'https://img.freepik.com/free-vector/flat-design-pizza-sale-banner_23-2149116013.jpg',
    'https://blog.lisi.menu/wp-content/uploads/2023/08/Food-Banner.jpg',
    'https://img.freepik.com/free-vector/flat-design-pizza-sale-banner_23-2149116013.jpg',
    'https://blog.lisi.menu/wp-content/uploads/2023/08/Food-Banner.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/007/420/763/small_2x/social-media-food-banner-design-free-vector.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: ListView(
        children: const [
          FlutterXfSliderImages(
            items: _images,
            height: 200,
          ),
        ],
      ),
    );
  }
}
