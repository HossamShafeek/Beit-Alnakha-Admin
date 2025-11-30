import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class ChefsView extends StatefulWidget {
  const ChefsView({super.key});

  @override
  State<ChefsView> createState() => _ChefsViewState();
}

class _ChefsViewState extends State<ChefsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chefs')),
      body: AdaptiveLayout(
        useFullScreenWidth: true,
        mobileLayout: (context) => const Center(child: Text('Chefs')),
        tabletLayout: (context)  => const Center(child: Text('Chefs')),
        desktopLayout: (context) => const Center(child: Text('Chefs')),
      ),
    );
  }
}
