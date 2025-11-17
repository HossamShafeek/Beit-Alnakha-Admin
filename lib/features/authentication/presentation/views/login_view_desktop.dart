import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/widgets/login_bg_widget.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/views/login_view_mobile.dart';
import 'package:flutter/material.dart';

class LoginViewDesktop extends StatelessWidget {
  const LoginViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.size24),
            child: LoginViewMobile(),
          ),
        ),
        Expanded( child: LoginBgWidget()),
      ],
    );
  }
}
