import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/decorative_painters.dart';
import '../widgets/site_components.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.isMobile,
    required this.onServices,
    required this.onAbout,
  });

  final bool isMobile;
  final VoidCallback onServices;
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ink,
      child: Stack(
        children: [
          const Positioned.fill(child: CustomPaint(painter: WavePainter())),
          pageWidth(
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: isMobile ? 60 : 52, bottom: 34),
                  child: isMobile
                      ? Column(
                          children: [
                            _heroCopy(onServices, onAbout, compact: true),
                            const SizedBox(height: 4),
                            const _HeroArtwork(compact: true),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: _heroCopy(onServices, onAbout)),
                            const Expanded(child: _HeroArtwork()),
                          ],
                        ),
                ),
                Container(
                  height: 58,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppColors.dividerDark),
                    ),
                  ),
                  child: isMobile
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'حلول إبداعية',
                              style: AppTheme.footerNoteStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.goldBright,
                              size: 20,
                            ),
                            Text(
                              'القاهرة · مصر',
                              style: AppTheme.footerNoteStyle,
                            ),
                          ],
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'حلول إبداعية من مكان واحد',
                              style: AppTheme.footerNoteStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.goldBright,
                              size: 20,
                            ),
                            Text(
                              'القاهرة · مصر',
                              style: AppTheme.footerNoteStyle,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroCopy(
    VoidCallback onServices,
    VoidCallback onAbout, {
    bool compact = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow(label: 'شركة دعاية وإعلان وحلول طباعة'),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'نصنع التفاصيل،\n'),
              TextSpan(
                children: [
                  const TextSpan(text: 'ونترك '),
                  TextSpan(
                    text: 'الانطباع.',
                    style: TextStyle(color: AppColors.goldBright),
                  ),
                ],
              ),
            ],
          ),
          style: TextStyle(
            color: AppColors.paper,
            fontSize: compact ? 45 : 66,
            height: 1.3,
            fontWeight: FontWeight.w500,
            letterSpacing: -1.4,
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 470),
          child: Text(
            'من أول فكرة لآخر لمسة، نحوّل رؤيتك إلى تجربة متكاملة وهوية تفضل حاضرة في أذهان عملائك.',
            style: TextStyle(
              color: AppColors.bodyOnDark,
              fontSize: 14,
              height: 2,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Wrap(
          spacing: 20,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            GoldButton(label: 'اكتشف خدماتنا', onTap: onServices),
            TextButton.icon(
              onPressed: onAbout,
              iconAlignment: IconAlignment.end,
              icon: const Icon(
                Icons.arrow_back,
                size: 15,
                color: AppColors.goldBright,
              ),
              label: const Text('اعرف حكايتنا'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.navText,
                textStyle: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(height: compact ? 28 : 55),
        Row(
          children: [
            SizedBox(
              width: compact ? 25 : 34,
              child: const Divider(color: AppColors.gold),
            ),
            SizedBox(width: compact ? 8 : 12),
            const Flexible(
              child: Text(
                'أفكار أذكى. جودة أدق. حضور أقوى.',
                style: AppTheme.footerNoteStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const SizedBox(
            width: 26,
            child: Divider(color: AppColors.goldBright),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.goldBright, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroArtwork extends StatelessWidget {
  const _HeroArtwork({this.compact = false});
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final height = compact ? 360.0 : 470.0;
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final centerWidth = compact ? 205.0 : 240.0;
          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: compact ? 320 : 390,
                height: compact ? 320 : 390,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.orbitBorder),
                ),
              ),
              Container(
                width: compact ? 265 : 325,
                height: compact ? 300 : 360,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.orbitBorderSoft),
                ),
              ),
              Container(
                width: centerWidth,
                height: compact ? 250 : 285,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.artTop, AppColors.artBottom],
                  ),
                  border: Border.all(color: AppColors.artFrame),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 50,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'د',
                      style: TextStyle(
                        color: AppColors.goldBright,
                        fontFamily: 'Georgia',
                        fontSize: compact ? 124 : 145,
                        height: 1,
                      ),
                    ),
                    Container(
                      width: 105,
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      color: AppColors.gold,
                    ),
                    const Text(
                      'فكرتك تستحق\nأن تُرى',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.artCaption,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: compact ? 23 : 68,
                right: compact ? -3 : 4,
                child: const _FloatingInfoCard(
                  icon: Icons.auto_awesome_outlined,
                  title: 'طباعة متقنة',
                  subtitle: 'تفاصيل تصنع الفرق',
                ),
              ),
              Positioned(
                bottom: compact ? 27 : 64,
                left: compact ? -2 : 4,
                child: const _FloatingInfoCard(
                  icon: Icons.diamond_outlined,
                  title: 'هوية متكاملة',
                  subtitle: 'من الفكرة إلى الواقع',
                ),
              ),
              if (!compact)
                const Positioned(
                  bottom: 10,
                  right: 5,
                  child: Text(
                    '01  /  05',
                    style: TextStyle(
                      color: AppColors.artIndex,
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _FloatingInfoCard extends StatelessWidget {
  const _FloatingInfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: const [
          BoxShadow(color: AppColors.cardShadow, blurRadius: 18),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.subtleGoldBorder),
            ),
            child: Icon(icon, size: 17, color: AppColors.goldBright),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: AppColors.paper, fontSize: 11),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.secondaryOnDark,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
