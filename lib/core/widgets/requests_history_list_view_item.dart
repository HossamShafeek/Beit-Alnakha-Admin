import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/status_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class RequestsHistoryListViewItem extends StatelessWidget {
  const RequestsHistoryListViewItem({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.size12),
        color: AppColors.grey100,
      ),
      padding: const EdgeInsets.all(AppSize.size12),
      child: Row(
        spacing: AppSize.size12,
        children: [
          CircleAvatar(
              radius: AppSize.size24,
              backgroundColor: AppColors.yellow3DWithOpacity10,
              child: SvgPicture.asset(AppAssets.orderFillPrimary)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: AppSize.size12,
                  children: [
                    Expanded(
                      child: Text(
                        '#123456789',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.semiBold16(
                          context,
                        ).copyWith(color: AppColors.black),
                      ),
                    ),
                    StatusContainerWidget(status: status),
                    // CustomPopupMenuButton(
                    //   items: buildPopupMenuItems(context, []),
                    //   child: Material(
                    //     clipBehavior: Clip.antiAlias,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(AppSize.size24),
                    //     ),
                    //     color: AppColors.grey100,
                    //     child: IconButton(
                    //       onPressed: () {},
                    //       icon: SvgPicture.asset(AppAssets.more),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  spacing: AppSize.size4,
                  children: [
                    SvgPicture.asset(
                      AppAssets.address,
                      width: AppSize.size20,
                      height: AppSize.size20,
                      colorFilter: ColorFilter.mode(
                        AppColors.black5B,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      'بغداد، الكرادة',
                      style: AppStyles.medium14(
                        context,
                      ).copyWith(color: AppColors.black),
                    ),
                  ],
                ),
                const Gap(AppSize.size6),
                Row(
                  spacing: AppSize.size8,
                  children: [
                    Row(
                      spacing: AppSize.size4,
                      children: [
                        SvgPicture.asset(
                          AppAssets.moneyCircle,
                          width: AppSize.size20,
                          height: AppSize.size20,
                          colorFilter: ColorFilter.mode(
                            AppColors.black5B,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          30000.toFormatMoney().toWithIraqCurrency(),
                          style: AppStyles.medium14(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: AppSize.size4,
                      backgroundColor: AppColors.grey300,
                    ),
                    Row(
                      spacing: AppSize.size4,
                      children: [
                        SvgPicture.asset(
                          AppAssets.date,
                          width: AppSize.size20,
                          height: AppSize.size20,
                          colorFilter: ColorFilter.mode(
                            AppColors.black5B,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '9 يونيو 2025 – 12:30 م',
                          style: AppStyles.medium14(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
