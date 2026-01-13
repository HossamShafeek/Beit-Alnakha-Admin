import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key, this.color, this.height, this.verticalPadding});

  final Color? color;
  final double? height;
  final double? verticalPadding;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalPadding??0),
      color: color ?? AppColors.greyE7,
      height:height?? AppSize.size1,
    );
  }
}
