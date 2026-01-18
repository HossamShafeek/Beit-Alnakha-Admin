import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/pagination_number_widget.dart';
import 'package:flutter/material.dart';

class SubDepartmentsDataTablePagination extends StatelessWidget {
  const SubDepartmentsDataTablePagination({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.size16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: PaginationNumberWidget(
          pageCount: 9999,
          currentPage: 50,
          onPageChanged: (page) {},
        ),
      ),
    );
  }
}
