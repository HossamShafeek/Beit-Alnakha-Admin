import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class AwardsView extends StatefulWidget {
  const AwardsView({super.key});

  @override
  State<AwardsView> createState() => _AwardsViewState();
}

class _AwardsViewState extends State<AwardsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Awards')),
      body: AdaptiveLayout(
        useFullScreenWidth: true,
        mobileLayout: (context) => const Center(child: Text('Awards')),
        tabletLayout: (context)  => const Center(child: Text('Awards')),
        desktopLayout: (context) => const Center(child: Text('Awards')),
      ),
    );
  }
}
