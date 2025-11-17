import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.size,
    this.withBorder = false,
  });

  final double? size;
  final bool withBorder;


  @override
  Widget build(BuildContext context) {
    return Image.asset(
  withBorder ? AppAssets.logo :   AppAssets.loginLogo,
      width: size ?? 150,
      height: size ?? 150,
    );
  }
}
