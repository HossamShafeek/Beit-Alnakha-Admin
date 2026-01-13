import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';

String getStatusEnumName(RequestStatusEnum status) {
  switch (status) {
    case RequestStatusEnum.newText:
      return AppStrings.newText;
    case RequestStatusEnum.preparing:
      return AppStrings.preparing;
    case RequestStatusEnum.prepared:
      return AppStrings.prepared;
    case RequestStatusEnum.delivering:
      return AppStrings.delivering;
    case RequestStatusEnum.delivered:
      return AppStrings.deliveredForTabBar;
    case RequestStatusEnum.cancelled:
      return AppStrings.canceledForTabBar;
  }
}