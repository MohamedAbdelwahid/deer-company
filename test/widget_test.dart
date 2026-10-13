// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:deer_company/app.dart';
import 'package:deer_company/widgets/whatsapp_button.dart';

void main() {
  testWidgets('shows DeeR Company landing page in Arabic', (tester) async {
    await tester.pumpWidget(const DeerCompanyApp());

    expect(find.text('DeeR'), findsNWidgets(2));
    expect(find.text('المطبعة'), findsOneWidget);
    expect(find.text('التسويق الرقمي'), findsOneWidget);
    expect(find.text('واتساب'), findsOneWidget);
    expect(WhatsAppButton.chatUri.toString(), 'https://wa.me/201020501267');
  });
}
