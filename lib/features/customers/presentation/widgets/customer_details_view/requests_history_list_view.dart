import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customer_details_view/requests_history_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RequestsHistoryListView extends StatelessWidget {
  const RequestsHistoryListView({super.key});

  final List<String> requestsStatusValues = const [
    AppStrings.preparing,
    AppStrings.prepared,
    AppStrings.canceled,
    AppStrings.preparing,
    AppStrings.prepared,
    AppStrings.canceled,
    AppStrings.preparing,
    AppStrings.prepared,
    AppStrings.canceled,
    AppStrings.preparing,
    AppStrings.prepared,
    AppStrings.canceled,
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return RequestsHistoryListViewItem(status: requestsStatusValues[index]);
      },
      separatorBuilder: (context, index) {
        return const Gap(AppSize.size8);
      },
      itemCount: requestsStatusValues.length,
    );
  }
}
