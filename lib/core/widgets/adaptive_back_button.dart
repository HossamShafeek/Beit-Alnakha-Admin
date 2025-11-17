import 'package:go_router/go_router.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdaptiveBackButton extends StatelessWidget {
  const AdaptiveBackButton({
    super.key,
    this.color,
    this.returnValueIfBack,
    required this.fallbackRoute,
  });

  final Color? color;
  final dynamic returnValueIfBack;
  final String fallbackRoute;

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
        if (context.canPop()) {
          context.pop(returnValueIfBack);
        } else {
          context.go(fallbackRoute);
        }
      },
    );
  }
}
