import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/requests_history_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AgentRequestsHistoryListView extends StatelessWidget {
  const AgentRequestsHistoryListView({super.key});

  final List<String> requestsStatusValues = const [
    AppStrings.delivering,
    AppStrings.deliveredForTabBar,
    AppStrings.canceled,
    AppStrings.delivering,
    AppStrings.deliveredForTabBar,
    AppStrings.canceled,
    AppStrings.delivering,
    AppStrings.deliveredForTabBar,
    AppStrings.canceled,
    AppStrings.delivering,
    AppStrings.deliveredForTabBar,
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
