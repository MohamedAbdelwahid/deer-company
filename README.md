# DeeR Company

موقع تعريفي عربي مبني باستخدام Flutter Web لشركة DeeR Company.

## تنظيم الملفات

- `lib/main.dart`: نقطة تشغيل التطبيق فقط.
- `lib/app.dart`: إعداد التطبيق وربط الأجزاء.
- `lib/theme/app_colors.dart`: لوحة الألوان المركزية.
- `lib/theme/app_theme.dart`: إعدادات الثيم وأنماط النصوص المشتركة.
- `lib/pages/landing_page.dart`: الصفحة الرئيسية والتنقل بين الأقسام.
- `lib/widgets/`: عناصر الواجهة المشتركة مثل الترويسة والأزرار.
- `lib/sections/`: كل قسم من أقسام الصفحة في ملف مستقل.

## التشغيل محليًا

```sh
flutter pub get
flutter run -d chrome
```

## إنشاء نسخة الويب

```sh
flutter build web
```
