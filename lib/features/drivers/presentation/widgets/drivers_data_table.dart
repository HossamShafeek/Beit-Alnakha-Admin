import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_data_table.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: false,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: false,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: false,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: true,
              ),
              DriversModel(
                driverName: 'محمد علي',
                phoneNumber: '+96407123456789',
                city: 'بغداد',
                requests: '15',
                deliveryType: 'خارجي',

                isActive: false,
              ),
            ].asMap().entries.map((e) {
              final index = e.key;
              final value = e.value;
              return DataRow(
                cells: [
                  textDataCell(context: context, text: '${index + 1}'),
                  textDataCell(context: context, text: value.driverName),
                  textDataCell(
                    context: context,
                    text: value.deliveryType,

                  ),
                  textDataCell(context: context, text: value.phoneNumber,   textDirection: TextDirection.ltr,),
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
                        IconButton(
                          splashRadius: AppSize.size20,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppAssets.more),
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
}

class DriversModel {
  final String driverName;
  final String deliveryType;
  final String phoneNumber;
  final String city;
  final String requests;
  final bool isActive;

  DriversModel({
    required this.deliveryType,
    required this.driverName,
    required this.phoneNumber,
    required this.city,
    required this.requests,
    required this.isActive,
  });
}
