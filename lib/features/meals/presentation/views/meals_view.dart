import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class MealsView extends StatefulWidget {
  const MealsView({super.key});

  @override
  State<MealsView> createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals')),
      body: AdaptiveLayout(
        useFullScreenWidth: true,
        mobileLayout: (context) => const Center(child: Text('Meals')),
        tabletLayout: (context)  => const Center(child: Text('Meals')),
        desktopLayout: (context) => const Center(child: Text('Meals')),
      ),
    );
  }
}
