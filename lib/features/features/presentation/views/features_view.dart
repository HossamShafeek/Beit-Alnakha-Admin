import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class FeaturesView extends StatefulWidget {
  const FeaturesView({super.key});

  @override
  State<FeaturesView> createState() => _FeaturesViewState();
}

class _FeaturesViewState extends State<FeaturesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Features')),
      body: AdaptiveLayout(
        useFullScreenWidth: true,
        mobileLayout: (context) => const Center(child: Text('Features')),
        tabletLayout: (context)  => const Center(child: Text('Features')),
        desktopLayout: (context) => const Center(child: Text('Features')),
      ),
    );
  }
}
