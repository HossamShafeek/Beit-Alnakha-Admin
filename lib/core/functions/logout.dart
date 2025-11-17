import 'package:beit_alnakha_admin/config/local/cache_helper.dart';
import 'package:beit_alnakha_admin/config/local/cache_helper_secure.dart';
import 'package:beit_alnakha_admin/config/routes/app_routes.dart';
import 'package:beit_alnakha_admin/config/routes/routes.dart';

void logout() async {
  await CacheHelperSecure.removeAllData();
  await CacheHelper.removeAllData();
  router.goNamed(Routes.loginView);
}
