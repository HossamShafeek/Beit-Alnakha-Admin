import 'dart:convert';
import 'package:beit_alnakha_admin/config/local/cache_helper.dart';
import 'package:beit_alnakha_admin/config/local/cache_helper_keys.dart';
import 'package:beit_alnakha_admin/config/local/cache_helper_secure.dart';
import 'package:beit_alnakha_admin/features/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:injectable/injectable.dart';


abstract class AuthenticationLocalDataSource {
  Future<void> saveUserData(AuthenticationModel loginModel);
}

@LazySingleton(as: AuthenticationLocalDataSource)
class AuthenticationLocalDataSourcesImplementation
    implements AuthenticationLocalDataSource {
  @override
  Future<void> saveUserData(AuthenticationModel loginModel) async {
    await CacheHelperSecure.setData(
      key: CacheHelperKeys.accessToken,
      value: loginModel.accessToken ?? '',
    );
    await CacheHelperSecure.setData(
      key: CacheHelperKeys.refreshToken,
      value: loginModel.refreshToken ?? '',
    );
    await CacheHelper.setString(
      key: CacheHelperKeys.userModel,
      value: jsonEncode(loginModel.toJson()),
    );
  }
}
