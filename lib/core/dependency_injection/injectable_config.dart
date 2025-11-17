import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:beit_alnakha_admin/core/dependency_injection/injectable_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
