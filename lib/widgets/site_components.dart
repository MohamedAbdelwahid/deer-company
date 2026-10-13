import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class GoldButton extends StatelessWidget {
  const GoldButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onTap,
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.north_west, size: 15),
      label: Text(label),
      style: FilledButton.styleFrom(
        foregroundColor: AppColors.ink,
        backgroundColor: AppColors.goldBright,
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
        shape: const RoundedRectangleBorder(),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel({
    super.key,
    required this.number,
    required this.title,
    this.light = false,
  });

  final String number;
  final String title;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: const TextStyle(
            color: AppColors.gold,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(width: 10),
        const SizedBox(
          width: 28,
          child: Divider(color: AppColors.gold, height: 1),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            color: light ? AppColors.sectionMuted : AppColors.muted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class CircleArrowButton extends StatelessWidget {
  const CircleArrowButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.buttonBrown,
          side: const BorderSide(color: AppColors.buttonBorder),
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: const Icon(Icons.north_west, size: 16),
      ),
    );
  }
}

Widget pageWidth(Widget child) {
  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1160),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: child,
      ),
    ),
  );
}
