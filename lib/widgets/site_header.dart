import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'site_components.dart';

class SiteHeader extends StatelessWidget {
  const SiteHeader({
    super.key,
    required this.isMobile,
    required this.menuOpen,
    required this.onMenuTap,
    required this.onHome,
    required this.onAbout,
    required this.onServices,
    required this.onApproach,
    required this.onContact,
  });

  final bool isMobile;
  final bool menuOpen;
  final VoidCallback onMenuTap;
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onServices;
  final VoidCallback onApproach;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ink,
      child: Column(
        children: [
          pageWidth(
            SizedBox(
              height: 82,
              child: Row(
                children: [
                  const _Brand(),
                  const Spacer(),
                  if (isMobile)
                    IconButton(
                      onPressed: onMenuTap,
                      tooltip: menuOpen ? 'إغلاق القائمة' : 'فتح القائمة',
                      icon: Icon(
                        menuOpen ? Icons.close : Icons.menu,
                        color: AppColors.goldBright,
                      ),
                    )
                  else ...[
                    _NavLink(label: 'الرئيسية', onTap: onHome),
                    _NavLink(label: 'عن الشركة', onTap: onAbout),
                    _NavLink(label: 'خدماتنا', onTap: onServices),
                    _NavLink(label: 'رؤيتنا', onTap: onApproach),
                    const SizedBox(width: 16),
                    _OutlineNavButton(label: 'ابدأ مشروعك', onTap: onContact),
                  ],
                ],
              ),
            ),
          ),
          if (isMobile && menuOpen)
            pageWidth(
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _MobileNavLink(label: 'الرئيسية', onTap: onHome),
                    _MobileNavLink(label: 'عن الشركة', onTap: onAbout),
                    _MobileNavLink(label: 'خدماتنا', onTap: onServices),
                    _MobileNavLink(label: 'رؤيتنا', onTap: onApproach),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _OutlineNavButton(
                        label: 'ابدأ مشروعك',
                        onTap: onContact,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const Divider(height: 1, color: AppColors.dividerDark),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        SizedBox(
          width: 40,
          height: 46,
          child: CustomPaint(painter: _BrandMarkPainter()),
        ),
        const SizedBox(width: 11),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DeeR',
              style: TextStyle(
                color: AppColors.paper,
                fontFamily: 'Georgia',
                fontSize: 25,
                height: 1,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'COMPANY',
              style: TextStyle(
                color: AppColors.paper,
                fontSize: 9,
                letterSpacing: 3,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BrandMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.goldBright
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.3
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.miter;
    final path = Path()
      ..moveTo(6, 4)
      ..lineTo(19, 4)
      ..lineTo(19, 12)
      ..cubicTo(19, 20, 31, 22, 32, 13)
      ..cubicTo(33, 7, 26, 5, 23, 10)
      ..moveTo(6, 4)
      ..lineTo(6, 24)
      ..cubicTo(6, 32, 11, 36, 18, 36)
      ..lineTo(21, 36)
      ..moveTo(35, 17)
      ..lineTo(43, 17)
      ..lineTo(43, 38)
      ..lineTo(35, 38)
      ..moveTo(35, 28)
      ..lineTo(23, 28)
      ..lineTo(23, 38)
      ..lineTo(35, 38)
      ..moveTo(6, 44)
      ..lineTo(44, 44)
      ..moveTo(6, 50)
      ..lineTo(44, 50);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.navText,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        textStyle: const TextStyle(fontSize: 13),
      ),
      child: Text(label),
    );
  }
}

class _MobileNavLink extends StatelessWidget {
  const _MobileNavLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        alignment: Alignment.centerRight,
        foregroundColor: AppColors.navText,
        padding: const EdgeInsets.symmetric(vertical: 13),
      ),
      child: Text(label),
    );
  }
}

class _OutlineNavButton extends StatelessWidget {
  const _OutlineNavButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.north_west, size: 15),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.goldBright,
        side: const BorderSide(color: AppColors.goldBorder),
        shape: const RoundedRectangleBorder(),
        textStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}
