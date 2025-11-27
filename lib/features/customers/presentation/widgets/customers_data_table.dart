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

class CustomersDataTable extends StatelessWidget {
  const CustomersDataTable({super.key});

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
            columns: AppStrings.columnsNameForCustomersDataTable
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
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: true,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: true,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: false,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: true,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: false,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: true,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: true,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: false,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: true,
                  ),
                  CustomersModel(
                    clientName: 'محمد علي',
                    whatsAppNumber: '+96407123456789',
                    city: 'بغداد',
                    requests: '15',
                    points: '11',
                    lastOrder: '15/5/2026',
                    isActive: false,
                  ),
                ].asMap().entries.map((e) {
                  final index = e.key;
                  final value = e.value;
                  return DataRow(
                    cells: [
                      textDataCell(context: context, text: '${index + 1}'),
                      textDataCell(context: context, text: value.clientName),
                      textDataCell(
                        context: context,
                        text: value.whatsAppNumber,
                        textDirection: TextDirection.ltr,
                      ),
                      textDataCell(context: context, text: value.city),
                      textDataCell(context: context, text: value.requests),
                      textDataCell(context: context, text: value.points),
                      textDataCell(context: context, text: value.lastOrder),
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

class CustomersModel {
  final String clientName;
  final String whatsAppNumber;
  final String city;
  final String requests;
  final String points;
  final String lastOrder;
  final bool isActive;

  CustomersModel({
    required this.clientName,
    required this.whatsAppNumber,
    required this.city,
    required this.requests,
    required this.points,
    required this.lastOrder,
    required this.isActive,
  });
}
