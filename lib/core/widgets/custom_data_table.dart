import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.physics,
    this.shrinkWrap,
    this.columnColor,
    this.horizontalDividerColor,
  });

  final List<DataColumn> columns;
  final List<DataRow> rows;
  final ScrollPhysics? physics;
  final Color ? columnColor;
  final Color ? horizontalDividerColor;
  final bool? shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          physics: physics ?? const NeverScrollableScrollPhysics(),
          // Ensures pull-to-refresh works
          shrinkWrap:shrinkWrap?? true,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: DataTable(
                  dividerThickness: 0,
                  border: TableBorder(
                    borderRadius: BorderRadius.circular(AppSize.size12),
                    bottom: BorderSide(width: 2, color: AppColors.white),

                    horizontalInside: BorderSide(
                      width: 2,
                      color: horizontalDividerColor??AppColors.greyF5,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(width: 2, color: AppColors.greyF5),
                    borderRadius: BorderRadius.circular(AppSize.size16),
                  ),
                  headingRowColor: WidgetStatePropertyAll(columnColor??AppColors.greyF5),
                  showBottomBorder: true,
                  columns: columns,
                  rows: rows,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

DataCell textDataCell({required BuildContext context, required String text,TextDirection? textDirection}) {
  return DataCell(
    Center(
      child: Text(
        text,
        textDirection:textDirection?? TextDirection.rtl,
        style: AppStyles.semiBold14(
          context,
        ).copyWith(color: AppColors.black),
      ),
    ),
  );
}

DataCell widgetDataCell({required Widget widget}) {
  return DataCell(Center(child: widget));
}
