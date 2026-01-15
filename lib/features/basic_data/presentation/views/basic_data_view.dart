import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class BasicDataView extends StatefulWidget {
  const BasicDataView({super.key});

  @override
  State<BasicDataView> createState() => _AwardsViewState();
}

class _AwardsViewState extends State<BasicDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Data')),
      body: AdaptiveLayout(
        useFullScreenWidth: true,
        mobileLayout: (context) => const Center(child: Text('Basic Data')),
        tabletLayout: (context)  => const Center(child: Text('Basic Data')),
        desktopLayout: (context) => const Center(child: Text('Basic Data')),
      ),
    );
  }
}
