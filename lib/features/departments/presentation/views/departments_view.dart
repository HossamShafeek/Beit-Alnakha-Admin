import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:flutter/material.dart';

class DepartmentsView extends StatefulWidget {
  const DepartmentsView({super.key});

  @override
  State<DepartmentsView> createState() => _DepartmentsViewState();
}

class _DepartmentsViewState extends State<DepartmentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Departments')),
      body: AdaptiveLayout(
        mobileLayout: (context) => const Center(child: Text('Departments')),
        tabletLayout: (context)  => const Center(child: Text('Departments')),
        desktopLayout: (context) => const Center(child: Text('Departments')),
      ),
    );
  }
}
