import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/site_components.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key, required this.onContact});
  final VoidCallback onContact;

  static const _services = [
    _ServiceData(
      icon: Icons.print_outlined,
      title: 'المطبعة',
      text: 'طباعة احترافية وتشطيب دقيق يخلّي كل مطبوع يعكس جودة علامتك.',
      english: 'PRINTING HOUSE',
    ),
    _ServiceData(
      icon: Icons.inventory_2_outlined,
      title: 'تغليف المنتجات الغذائية',
      text: 'حلول تغليف جذابة وعملية تمنح منتجك حضورًا مميزًا على الرف.',
      english: 'FOOD PACKAGING',
    ),
    _ServiceData(
      icon: Icons.trending_up,
      title: 'التسويق الرقمي',
      text: 'أفكار واستراتيجيات رقمية تقرّبك من جمهورك وتدعم نمو أعمالك.',
      english: 'DIGITAL MARKETING',
    ),
    _ServiceData(
      icon: Icons.image_outlined,
      title: 'التصميمات والسوشيال ميديا',
      text: 'تصميمات متناسقة تخلي صوت علامتك وشكلها واضحين في كل منصة.',
      english: 'SOCIAL DESIGNS',
    ),
    _ServiceData(
      icon: Icons.card_giftcard,
      title: 'الهدايا الدعائية',
      text: 'هدايا بتفاصيل مخصصة تخلّي علامتك جزءًا من يوم عملائك.',
      english: 'PROMOTIONAL GIFTS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ink,
      child: pageWidth(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 94),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final narrow = constraints.maxWidth < 700;
                  final heading = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionLabel(
                        number: '02',
                        title: 'ماذا نقدم؟',
                        light: true,
                      ),
                      const SizedBox(height: 22),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'كل ما تحتاجه علامتك،\n'),
                            TextSpan(
                              text: 'تحت سقف واحد.',
                              style: TextStyle(color: AppColors.goldBright),
                            ),
                          ],
                        ),
                        style: const TextStyle(
                          color: AppColors.paper,
                          fontSize: 43,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                  const description = Text(
                    'خدمات متكاملة تساعدك تظهر بأفضل صورة، وتوصل رسالتك بالشكل الصح.',
                    style: TextStyle(
                      color: AppColors.secondaryBody,
                      fontSize: 12,
                      height: 2,
                    ),
                  );
                  if (narrow) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heading,
                        const SizedBox(height: 16),
                        description,
                      ],
                    );
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: heading),
                      const SizedBox(width: 30),
                      const SizedBox(width: 280, child: description),
                    ],
                  );
                },
              ),
              const SizedBox(height: 37),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth < 430
                      ? 1
                      : (constraints.maxWidth < 760 ? 2 : 3);
                  final gap = 0.0;
                  final cardWidth =
                      (constraints.maxWidth - gap * (columns - 1)) / columns;
                  return Wrap(
                    children: [
                      for (var i = 0; i < _services.length; i++)
                        SizedBox(
                          width: cardWidth,
                          height: 263,
                          child: _ServiceCard(index: i + 1, data: _services[i]),
                        ),
                      SizedBox(
                        width: cardWidth,
                        height: 263,
                        child: _ServiceMoreCard(onTap: onContact),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceData {
  const _ServiceData({
    required this.icon,
    required this.title,
    required this.text,
    required this.english,
  });

  final IconData icon;
  final String title;
  final String text;
  final String english;
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.index, required this.data});
  final int index;
  final _ServiceData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.dividerDark),
          right: BorderSide(color: AppColors.dividerDark),
          bottom: BorderSide(color: AppColors.dividerDark),
          left: BorderSide(color: AppColors.dividerDark),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.subtleGoldBorderStrong),
                ),
                child: Icon(data.icon, color: AppColors.goldBright, size: 23),
              ),
              const Spacer(),
              Text(
                index.toString().padLeft(2, '0'),
                style: const TextStyle(
                  color: AppColors.indexMuted,
                  fontSize: 11,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
          Text(
            data.title,
            style: const TextStyle(color: AppColors.paper, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            data.text,
            style: const TextStyle(
              color: AppColors.secondaryOnDark,
              fontSize: 11,
              height: 1.8,
            ),
          ),
          const Spacer(),
          Text(
            data.english,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              color: AppColors.serviceEnglish,
              fontSize: 9,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceMoreCard extends StatelessWidget {
  const _ServiceMoreCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.dividerDark),
            right: BorderSide(color: AppColors.dividerDark),
            bottom: BorderSide(color: AppColors.dividerDark),
            left: BorderSide(color: AppColors.dividerDark),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.goldBorderStrong),
              ),
              child: const Icon(
                Icons.north_west,
                color: AppColors.goldBright,
                size: 19,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'عندك فكرة مختلفة؟',
              style: TextStyle(color: AppColors.moreCardText, fontSize: 13),
            ),
            const SizedBox(height: 5),
            const Text(
              'خلينا ننفذها سوا.',
              style: TextStyle(color: AppColors.goldBright, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
