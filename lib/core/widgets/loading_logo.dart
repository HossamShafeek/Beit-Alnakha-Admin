import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';

class LoadingLogo extends StatelessWidget {
  const LoadingLogo({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAssets.loading,
        width: size ?? 100,
        height: size ?? 100,
      ),
    );
  }
}
