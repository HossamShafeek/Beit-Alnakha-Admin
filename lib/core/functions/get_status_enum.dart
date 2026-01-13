import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';

RequestStatusEnum getStatusEnum(String status) {
  switch (status) {
    case AppStrings.newText:
      return RequestStatusEnum.newText;
    case AppStrings.preparing:
      return RequestStatusEnum.preparing;
    case AppStrings.prepared:
      return RequestStatusEnum.prepared;
    case AppStrings.delivering:
      return RequestStatusEnum.delivering;
    case AppStrings.deliveredForTabBar:
      return RequestStatusEnum.delivered;
    default:
      return RequestStatusEnum.cancelled;
  }
}