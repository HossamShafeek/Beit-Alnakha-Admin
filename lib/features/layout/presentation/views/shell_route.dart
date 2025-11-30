import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/widgets/layout_app_bar.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/widgets/side_bar_widget.dart';
import 'package:flutter/material.dart';


class ShellRout extends StatelessWidget {
  const ShellRout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: AppConstants.layoutKey,
      resizeToAvoidBottomInset: false,
      drawer: SideBarWidget(),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if(context.width>=ScreenWidthBreakpoints.tablet)...[
              SideBarWidget(),
            ],
            Expanded(
              child: Column(
                children: [
                  LayoutAppBar(),
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
