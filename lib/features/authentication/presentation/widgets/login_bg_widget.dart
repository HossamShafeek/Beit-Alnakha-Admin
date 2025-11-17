import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/animations/fade_transition_animation.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';

class LoginBgWidget extends StatelessWidget {
  const LoginBgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeTransitionAnimation(
      duration: const Duration(milliseconds: 500),
      child: Image.asset(
             AppAssets.loginBg,
      ),
    );
  }
}
