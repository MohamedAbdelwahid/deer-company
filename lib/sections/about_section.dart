import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/site_components.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.onExplore});
  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.paper,
      child: pageWidth(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 105),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final narrow = constraints.maxWidth < 700;
              final label = const SectionLabel(number: '01', title: 'من نحن؟');
              final content = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DeeR Company — شريكك الإبداعي',
                    style: TextStyle(color: AppColors.bronze, fontSize: 12),
                  ),
                  const SizedBox(height: 14),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'نحوّل رؤيتك إلى\n'),
                        TextSpan(
                          text: 'علامة تستحق أن تُذكر.',
                          style: TextStyle(color: AppColors.bronzeAccent),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 43,
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(
                        child: Text(
                          'DeeR شركة دعاية وإعلان بتجمع بين الفكرة والتنفيذ؛ من التخطيط والتصميم، للطباعة والتغليف والتشطيب. نهتم بكل تفصيلة عشان نبني لعلامتك حضورًا واضحًا وتجربة تليق بيها.',
                          style: TextStyle(
                            color: AppColors.bodyOnLight,
                            fontSize: 13,
                            height: 2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      CircleArrowButton(onTap: onExplore),
                    ],
                  ),
                ],
              );
              if (narrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [label, const SizedBox(height: 28), content],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 160,
                    child: SectionLabel(number: '01', title: 'من نحن؟'),
                  ),
                  Expanded(child: content),
                  const SizedBox(width: 36),
                  const _AboutStamp(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AboutStamp extends StatelessWidget {
  const _AboutStamp();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(top: 64),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.stampBorder),
      ),
      child: const Center(
        child: Text(
          'IDEAS\nMADE\nVISIBLE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.bronze,
            fontFamily: 'Arial',
            fontSize: 9,
            letterSpacing: 2,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
