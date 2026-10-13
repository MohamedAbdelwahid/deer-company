import 'package:web/web.dart' as web;

void reloadPage() {
  web.window.location.reload();
}

Future<void> refreshPage() async {
  await Future<void>.delayed(const Duration(milliseconds: 250));
  reloadPage();
}
