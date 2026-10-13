import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/approach_section.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/services_section.dart';
import '../widgets/site_header.dart';
import '../widgets/whatsapp_button.dart';
import '../services/page_reloader.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _approachKey = GlobalKey();
  final _contactKey = GlobalKey();

  Future<void> _jumpTo(GlobalKey key) async {
    final target = key.currentContext;
    if (target == null) return;
    await Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.04,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;
        return Scaffold(
          floatingActionButton: const WhatsAppButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SiteHeader(
                  isMobile: isMobile,
                  onHome: () => _jumpTo(_homeKey),
                  onAbout: () => _jumpTo(_aboutKey),
                  onServices: () => _jumpTo(_servicesKey),
                  onApproach: () => _jumpTo(_approachKey),
                  onContact: () => _jumpTo(_contactKey),
                  onRefresh: reloadPage,
                ),
                HeroSection(
                  key: _homeKey,
                  isMobile: isMobile,
                  onServices: () => _jumpTo(_servicesKey),
                  onAbout: () => _jumpTo(_aboutKey),
                ),
                AboutSection(
                  key: _aboutKey,
                  onExplore: () => _jumpTo(_approachKey),
                ),
                ServicesSection(
                  key: _servicesKey,
                  onContact: () => _jumpTo(_contactKey),
                ),
                ApproachSection(key: _approachKey),
                ContactSection(
                  key: _contactKey,
                  onServices: () => _jumpTo(_servicesKey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
