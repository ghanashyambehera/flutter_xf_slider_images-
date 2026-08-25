import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_xf_slider_images/flutter_xf_slider_images.dart';

import 'package:flutter_xf_slider_images_example/main.dart';

void main() {
  testWidgets('shows slider and page indicator', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Plugin example app'), findsOneWidget);
    expect(find.byType(FlutterXfSliderImages), findsOneWidget);
    expect(find.byType(SliderPageIndicator), findsOneWidget);
  });
}
