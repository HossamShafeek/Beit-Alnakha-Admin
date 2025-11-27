import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';

String getStatusIcon(String status) {
  switch (status) {
    case AppStrings.newText:
      return AppAssets.newOrder;
    case AppStrings.preparing:
      return AppAssets.waiting;
    case AppStrings.prepared:
      return AppAssets.prepared;
    case AppStrings.delivering:
      return AppAssets.delivering;
    case AppStrings.deliveredForTabBar:
      return AppAssets.done;
    default:
        return AppAssets.cancelOrder;
  }
}