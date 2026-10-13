import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/decorative_painters.dart';
import '../widgets/site_components.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.onServices});
  final VoidCallback onServices;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ink,
      child: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(painter: WavePainter(subtle: true)),
          ),
          Column(
            children: [
              pageWidth(
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 84),
                  child: Column(
                    children: [
                      const SectionLabel(
                        number: '04',
                        title: 'جاهز تبدأ؟',
                        light: true,
                      ),
                      const SizedBox(height: 17),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'فكرتك الجاية\n'),
                            TextSpan(
                              text: 'تبدأ من هنا.',
                              style: TextStyle(color: AppColors.goldBright),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.paper,
                          fontSize: 58,
                          height: 1.35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'احكيلنا عن مشروعك، ونساعدك تختار الحل اللي يليق بعلامتك.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.contactText,
                          fontSize: 12,
                          height: 1.9,
                        ),
                      ),
                      const SizedBox(height: 24),
                      GoldButton(label: 'اكتشف خدماتنا', onTap: onServices),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, color: AppColors.dividerDark),
              pageWidth(
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 560) {
                      return const SizedBox(
                        height: 76,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _FooterBrand(),
                            Text(
                              '© 2026 DeeR Company',
                              style: AppTheme.footerNoteStyle,
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox(
                      height: 76,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _FooterBrand(),
                          Text(
                            'نصنع التفاصيل، ونترك الانطباع.',
                            style: AppTheme.footerNoteStyle,
                          ),
                          Text(
                            '© 2026 DeeR Company',
                            style: AppTheme.footerNoteStyle,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  const _FooterBrand();

  @override
  Widget build(BuildContext context) {
    return const Row(
      textDirection: TextDirection.ltr,
      children: [
        Text(
          'DeeR',
          style: TextStyle(
            color: AppColors.paper,
            fontFamily: 'Georgia',
            fontSize: 20,
          ),
        ),
        SizedBox(width: 7),
        Text(
          'COMPANY',
          style: TextStyle(
            color: AppColors.footerBrand,
            fontSize: 8,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
