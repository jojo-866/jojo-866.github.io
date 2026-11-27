import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app/app.dart';
import 'package:portfolio/app/bindings/intial_binding.dart';

void main() {
  testWidgets('the app starts and shows the name', (tester) async {
    InitialBinding().dependencies();
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Jyotsana Regmi'), findsWidgets);
  });
}