import 'package:go_router/go_router.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color, this.moreActions});
  final Color? color;
  final VoidCallback? moreActions;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      splashRadius: AppSize.size24,
      iconSize: AppSize.size35,
      icon: SvgPicture.asset(
        AppAssets.arrowRight,
        height: AppSize.size35,
        width: AppSize.size35,
      ),
      onPressed: () {
        moreActions?.call();
        context.pop();
      },
    );
  }
}
