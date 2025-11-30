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
import 'package:beit_alnakha_admin/core/widgets/status_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestsDataTable extends StatelessWidget {
  const RequestsDataTable({super.key});

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
            columns: AppStrings.columnsNameForRequestsDataTable
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
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي' ,
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'جديد',
                    tableNumber: '1',
                    delegate: 'محمد علي' ,
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'قيد التحضير',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'ملغي',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'تم التجهيز',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'قيد التوصيل',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'تم التسليم',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'جديد',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'قيد التحضير',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'ملغي',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                  RequestsModel(
                    id: '1',
                    customerName: 'محمد علي',
                    date: '10:32 ص – اليوم',
                    requestType: 'داخلي',
                    status: 'تم التجهيز',
                    tableNumber: '1',
                    delegate: 'محمد علي',
                  ),
                ].asMap().entries.map((e) {
                  final index = e.key;
                  final value = e.value;
                  return DataRow(
                    cells: [
                      textDataCell(context: context, text: '${index + 1}'),
                      textDataCell(context: context, text: value.id),
                      textDataCell(
                        context: context,
                        text: value.customerName,
                      ),
                      textDataCell(context: context, text: value.date),
                      textDataCell(
                        context: context,
                        text: value.requestType,
                      ),
                      widgetDataCell(widget: StatusContainerWidget(status: value.status)),
                      textDataCell(
                        context: context,
                        text: value.tableNumber,
                      ),
                      textDataCell(context: context, text: value.delegate),
                      widgetDataCell(
                        widget:     CustomPopupMenuButton(
                          onSelected: (value) {},
                          items: buildPopupMenuItems(context, [
                            MenuActionEnum.viewDetails,
                            MenuActionEnum.edit,
                            MenuActionEnum.updateStatus,
                            MenuActionEnum.addNote,
                            MenuActionEnum.delete,
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

class RequestsModel {
  final String id;
  final String customerName;
  final String date;
  final String requestType;
  final String status;
  final String tableNumber;
  final String delegate;

  RequestsModel({
    required this.id,
    required this.customerName,
    required this.date,
    required this.requestType,
    required this.status,
    required this.tableNumber,
    required this.delegate,
  });
}


