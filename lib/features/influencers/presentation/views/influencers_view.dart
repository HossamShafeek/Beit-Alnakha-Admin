import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class InfluencersView extends StatefulWidget {
  const InfluencersView({super.key});

  @override
  State<InfluencersView> createState() => _InfluencersViewState();
}

class _InfluencersViewState extends State<InfluencersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Influencers')),
      body: AdaptiveLayout(
        useFullScreenWidth: true,
        mobileLayout: (context) => const Center(child: Text('Influencers')),
        tabletLayout: (context)  => const Center(child: Text('Influencers')),
        desktopLayout: (context) => const Center(child: Text('Influencers')),
      ),
    );
  }
}
