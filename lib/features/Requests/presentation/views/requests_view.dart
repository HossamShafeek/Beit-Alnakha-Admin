import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class RequestsView extends StatefulWidget {
  const RequestsView({super.key});

  @override
  State<RequestsView> createState() => _RequestsViewState();
}

class _RequestsViewState extends State<RequestsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Requests')),
      body: AdaptiveLayout(
        mobileLayout: (context) => const Center(child: Text('Requests')),
        tabletLayout: (context)  => const Center(child: Text('Requests')),
        desktopLayout: (context) => const Center(child: Text('Requests')),
      ),
    );
  }
}
