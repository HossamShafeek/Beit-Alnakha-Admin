import 'dart:developer';

import 'package:beit_alnakha_admin/config/routes/routes.dart';
import 'package:beit_alnakha_admin/core/functions/build_popup_menu_items.dart';
import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_data_table.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_popup_menu_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/views/update_driver_view.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/drivers_view/delete_driver_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DriversDataTable extends StatelessWidget {
  const DriversDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),
      ),
      child: Column(
        children: [
          CustomDataTable(
            columns: AppStrings.columnsNameForDriversDataTable
                .map(
                  (e) => DataColumn(
                label: Expanded(
                  child: Center(
                    child: Text(
                      e,
                      style: AppStyles.medium14(
                        context,
                      ).copyWith(color: AppColors.grey7A),
                    ),
                  ),
                ),
              ),
            )
                .toList(),
            rows:
            [
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: false,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: false,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: false,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                points: 5000,
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                isActive: false,
              ),
            ].asMap().entries.map((e) {
              final index = e.key;
              final value = e.value;
              return DataRow(
                cells: [
                  textDataCell(context: context, text: '${index + 1}'),
                  textDataCell(context: context, text: value.driverName),
                  textDataCell(context: context, text: value.phoneNumber,   textDirection: TextDirection.ltr,),
                  textDataCell(context: context, text: '${value.points} ${AppStrings.point}'),
                  textDataCell(context: context, text: value.city),
                  textDataCell(context: context, text: value.requests),

                  widgetDataCell(
                    widget: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: AppSize.size8,
                      children: [
                        CustomSwitch(
                          value: value.isActive,
                          onChanged: (value) {},
                        ),
                        CustomPopupMenuButton(
                          onSelected: (value) {
                            if(value == MenuActionEnum.viewDetails){
                              context.pushNamed(Routes.driverDetailsView,
                                  pathParameters: {
                                    'driverId': '112000',
                                  }
                              );
                            }else if(value == MenuActionEnum.whatsappContact){
                              log('whatsappContact');
                            }
                            else if(value == MenuActionEnum.edit){
                              showUpdateDriverDialog(context: context);
                            }else if(value == MenuActionEnum.delete){
                              showDeleteDriverDialog(context: context);
                            }
                          },
                          items: buildPopupMenuItems(context, [
                            MenuActionEnum.viewDetails,
                            MenuActionEnum.edit,
                            MenuActionEnum.delete,
                            MenuActionEnum.whatsappContact,
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSize.size6),
                            child: SvgPicture.asset(
                              AppAssets.more,
                              height: AppSize.size24,
                              width: AppSize.size24,
                              colorFilter: const ColorFilter.mode(
                                AppColors.secondaryBlack,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
  void showUpdateDriverDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateDriverView();
      },
    );
  }
  void showDeleteDriverDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDriverDialog();
      },
    );
  }
}

class DriversModel {
  final String driverName;
  final num points;
  final String phoneNumber;
  final String city;
  final String requests;
  final bool isActive;

  DriversModel({
    required this.points,
    required this.driverName,
    required this.phoneNumber,
    required this.city,
    required this.requests,
    required this.isActive,
  });
}
