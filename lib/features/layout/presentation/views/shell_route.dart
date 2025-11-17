import 'package:beit_alnakha_admin/features/layout/presentation/widgets/side_bar_widget.dart';
import 'package:flutter/material.dart';


class ShellRout extends StatelessWidget {
  const ShellRout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,

      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Row(
          children: [
            SideBarWidget(),
            Expanded(
              child: Column(
                children: [
                  // HomeAppBar(),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
