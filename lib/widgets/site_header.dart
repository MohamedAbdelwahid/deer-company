import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'site_components.dart';

enum _SiteMenuAction { home, about, services, approach, contact }

class SiteHeader extends StatelessWidget {
  const SiteHeader({
    super.key,
    required this.isMobile,
    required this.onHome,
    required this.onAbout,
    required this.onServices,
    required this.onApproach,
    required this.onContact,
    required this.onRefresh,
  });

  final bool isMobile;
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onServices;
  final VoidCallback onApproach;
  final VoidCallback onContact;
  final VoidCallback onRefresh;

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
                  IconButton(
                    onPressed: onRefresh,
                    tooltip: 'تحديث الصفحة',
                    icon: const Icon(
                      Icons.refresh,
                      color: AppColors.goldBright,
                    ),
                  ),
                  if (isMobile)
                    PopupMenuButton<_SiteMenuAction>(
                      tooltip: 'فتح القائمة',
                      position: PopupMenuPosition.under,
                      color: AppColors.paper,
                      surfaceTintColor: Colors.transparent,
                      elevation: 10,
                      constraints: const BoxConstraints(
                        minWidth: 220,
                        maxWidth: 280,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(color: Color(0xFFE3D9CC)),
                      ),
                      icon: const Icon(Icons.menu, color: AppColors.goldBright),
                      onSelected: (action) {
                        switch (action) {
                          case _SiteMenuAction.home:
                            onHome();
                          case _SiteMenuAction.about:
                            onAbout();
                          case _SiteMenuAction.services:
                            onServices();
                          case _SiteMenuAction.approach:
                            onApproach();
                          case _SiteMenuAction.contact:
                            onContact();
                        }
                      },
                      itemBuilder: (context) => [
                        _menuItem(_SiteMenuAction.home, 'الرئيسية'),
                        _menuItem(_SiteMenuAction.about, 'من نحن'),
                        _menuItem(_SiteMenuAction.services, 'خدماتنا'),
                        _menuItem(_SiteMenuAction.approach, 'رؤيتنا'),
                        _menuItem(_SiteMenuAction.contact, 'تواصل معنا'),
                      ],
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
          const Divider(height: 1, color: AppColors.dividerDark),
        ],
      ),
    );
  }

  PopupMenuItem<_SiteMenuAction> _menuItem(
    _SiteMenuAction action,
    String title,
  ) {
    return PopupMenuItem<_SiteMenuAction>(
      value: action,
      height: 48,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.ink,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
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
