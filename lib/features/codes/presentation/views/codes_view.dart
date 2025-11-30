import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class CodesView extends StatefulWidget {
  const CodesView({super.key});

  @override
  State<CodesView> createState() => _CodesViewState();
}

class _CodesViewState extends State<CodesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Codes')),
      body: AdaptiveLayout(
        useFullScreenWidth: true,
        mobileLayout: (context) => const Center(child: Text('Codes')),
        tabletLayout: (context)  => const Center(child: Text('Codes')),
        desktopLayout: (context) => const Center(child: Text('Codes')),
      ),
    );
  }
}
