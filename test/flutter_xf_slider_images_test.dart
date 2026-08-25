import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_xf_slider_images/flutter_xf_slider_images.dart';

void main() {
  testWidgets('renders carousel and indicator for image urls', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FlutterXfSliderImages(
            items: [
              'https://example.com/a.jpg',
              'https://example.com/b.jpg',
            ],
            height: 160,
            autoPlay: false,
          ),
        ),
      ),
    );

    expect(find.byType(FlutterXfSliderImages), findsOneWidget);
    expect(find.byType(SliderPageIndicator), findsOneWidget);
  });

  testWidgets('hides indicator when showIndicator is false', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FlutterXfSliderImages(
            items: ['https://example.com/a.jpg'],
            showIndicator: false,
            autoPlay: false,
          ),
        ),
      ),
    );

    expect(find.byType(SliderPageIndicator), findsNothing);
  });
}
