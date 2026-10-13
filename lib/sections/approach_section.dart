import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/site_components.dart';

class ApproachSection extends StatelessWidget {
  const ApproachSection({super.key});

  static const _steps = [
    (
      '01',
      'نسمع ونخطط',
      'نفهم هدفك وجمهورك قبل ما نبدأ، عشان كل خطوة تبقى في مكانها.',
    ),
    (
      '02',
      'نصمم وننفذ',
      'نحوّل الفكرة لحلول مدروسة، بجودة نهتم فيها بكل تفصيلة.',
    ),
    (
      '03',
      'نراجع وندعم',
      'نفضل قريبين منك بعد التسليم، عشان تجربتك تفضل متكاملة.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.paperDeep,
      child: pageWidth(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 102),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final title = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionLabel(number: '03', title: 'طريقتنا'),
                  const SizedBox(height: 22),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'مش بس بنسلّم شغل،\n'),
                        TextSpan(
                          text: 'بنكمّل معاك الطريق.',
                          style: TextStyle(color: AppColors.bronzeAccent),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 38,
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
              final steps = Column(
                children: [
                  for (final step in _steps)
                    _ApproachStep(
                      number: step.$1,
                      title: step.$2,
                      text: step.$3,
                    ),
                ],
              );
              if (constraints.maxWidth < 700) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [title, const SizedBox(height: 25), steps],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: title),
                  const SizedBox(width: 70),
                  Expanded(child: steps),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ApproachStep extends StatelessWidget {
  const _ApproachStep({
    required this.number,
    required this.title,
    required this.text,
  });

  final String number;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.lightDivider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 43,
            child: Text(
              number,
              style: const TextStyle(color: AppColors.gold, fontSize: 11),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: AppColors.ink, fontSize: 16),
                ),
                const SizedBox(height: 7),
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.bodyMuted,
                    fontSize: 11,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.north_west, color: AppColors.gold, size: 15),
        ],
      ),
    );
  }
}
