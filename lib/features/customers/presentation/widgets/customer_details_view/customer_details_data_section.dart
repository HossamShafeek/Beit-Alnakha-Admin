import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customer_details_view/customer_details_data_section_app_bar.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customer_details_view/customer_details_data_section_body.dart';
import 'package:flutter/material.dart';

class CustomerDetailsDataSection extends StatelessWidget {
  const CustomerDetailsDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      child: Column(
        spacing: AppSize.size10,
        children: [
          CustomerDetailsDataSectionAppBar(),
          CustomerDetailsDataSectionBody(),
        ],
      ),
    );
  }
}
