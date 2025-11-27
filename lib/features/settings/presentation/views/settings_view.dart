import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: AdaptiveLayout(
        mobileLayout: (context) => const Center(child: Text('Settings')),
        tabletLayout: (context)  => const Center(child: Text('Settings')),
        desktopLayout: (context) => const Center(child: Text('Settings')),
      ),
    );
  }
}
