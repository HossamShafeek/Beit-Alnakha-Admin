import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';

String getStatusIcon(RequestStatusEnum status) {
  switch (status) {
    case RequestStatusEnum.newText:
      return AppAssets.newOrder;
    case RequestStatusEnum.preparing:
      return AppAssets.waiting;
    case RequestStatusEnum.prepared:
      return AppAssets.prepared;
    case RequestStatusEnum.delivering:
      return AppAssets.delivering;
    case RequestStatusEnum.delivered:
      return AppAssets.done;
   case RequestStatusEnum.cancelled:
        return AppAssets.cancelOrder;
  }
}