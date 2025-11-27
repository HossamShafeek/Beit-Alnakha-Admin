import 'package:beit_alnakha_admin/core/widgets/pagination_number_widget.dart';
import 'package:flutter/material.dart';

class DriversDataTablePagination extends StatelessWidget {
  const DriversDataTablePagination({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: PaginationNumberWidget(
        pageCount: 9999,
        currentPage: 50,
        onPageChanged: (page) {},
      ),
    );
  }
}
