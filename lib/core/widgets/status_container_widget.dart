import 'package:beit_alnakha_admin/core/functions/get_status_color.dart';
import 'package:beit_alnakha_admin/core/functions/get_status_icon.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusContainerWidget extends StatelessWidget {
  const StatusContainerWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size12,
        vertical: (AppSize.size4),
      ),
      decoration: BoxDecoration(
        color: getStatusColor(status)[1],
        borderRadius: BorderRadius.circular(AppSize.size8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSize.size4,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            getStatusIcon(status),
            width: AppSize.size20,
            height: AppSize.size20,
            colorFilter: ColorFilter.mode(
              getStatusColor(status)[0],
              BlendMode.srcIn,
            ),
          ),
          Text(
            status,
            textAlign: TextAlign.center,
            style: AppStyles.semiBold14(
              context,
            ).copyWith(color: getStatusColor(status)[0]),
          ),
        ],
      ),
    );
  }
}