import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppButton extends StatelessWidget {
  const WhatsAppButton({super.key});

  static final Uri chatUri = Uri.https('wa.me', '/201020501267');

  Future<void> _openChat(BuildContext context) async {
    final launched = await launchUrl(
      chatUri,
      mode: LaunchMode.externalApplication,
    );
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'تعذّر فتح واتساب. حاول مرة أخرى أو استخدم الرقم +20 10 20501267.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _openChat(context),
      tooltip: 'راسلنا على واتساب',
      backgroundColor: const Color(0xFF25D366),
      foregroundColor: Colors.white,
      icon: const Icon(Icons.chat_outlined),
      label: const Text('واتساب'),
    );
  }
}
