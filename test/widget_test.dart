// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
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
    expect(find.byType(RefreshIndicator), findsOneWidget);
    expect(find.byTooltip('تحديث الصفحة'), findsNothing);
  });

  testWidgets('opens the mobile navigation menu', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DeerCompanyApp());
    await tester.tap(find.byTooltip('فتح القائمة'));
    await tester.pumpAndSettle();

    expect(find.text('من نحن'), findsOneWidget);
    expect(find.text('خدماتنا'), findsOneWidget);
    expect(find.text('تواصل معنا'), findsOneWidget);
  });

  testWidgets('supports pull-to-refresh from the top of the page', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DeerCompanyApp());
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, 360));
    await tester.pumpAndSettle();

    expect(find.byType(RefreshIndicator), findsOneWidget);
  });
}
