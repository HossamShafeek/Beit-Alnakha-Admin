import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:beit_alnakha_admin/core/widgets/loading_logo.dart';

class CustomFullLoading extends StatelessWidget {
  const CustomFullLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.white,
      opacity: 0.5,
      progressIndicator: LoadingLogo(),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
