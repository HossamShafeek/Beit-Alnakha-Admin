// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:beit_alnakha_admin/core/api/api_services.dart' as _i738;
import 'package:beit_alnakha_admin/core/api/api_services_implementation.dart'
    as _i505;
import 'package:beit_alnakha_admin/core/api/app_interceptors.dart' as _i463;
import 'package:beit_alnakha_admin/features/authentication/data/data_source/authentication_local_data_source.dart'
    as _i28;
import 'package:beit_alnakha_admin/features/authentication/data/data_source/authentication_remote_data_source.dart'
    as _i542;
import 'package:beit_alnakha_admin/features/authentication/data/repository/authentication_repository_implemenation.dart'
    as _i600;
import 'package:beit_alnakha_admin/features/authentication/domain/repository/authentication_repository.dart'
    as _i519;
import 'package:beit_alnakha_admin/features/authentication/domain/use_cases/login_use_case.dart'
    as _i556;
import 'package:beit_alnakha_admin/features/authentication/presentation/cubits/login_cubit/login_cubit.dart'
    as _i275;
import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_cubit.dart'
    as _i1029;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i1029.SideBarCubit>(() => _i1029.SideBarCubit());
    gh.lazySingleton<_i463.AppInterceptors>(() => _i463.AppInterceptors());
    gh.lazySingleton<_i28.AuthenticationLocalDataSource>(
      () => _i28.AuthenticationLocalDataSourcesImplementation(),
    );
    gh.lazySingleton<_i738.ApiServices>(
      () => _i505.ApiServicesImplementation(gh<_i463.AppInterceptors>()),
    );
    gh.lazySingleton<_i542.AuthenticationRemoteDataSource>(
      () => _i542.AuthenticationRemoteDataSourceImplementation(
        apiServices: gh<_i738.ApiServices>(),
      ),
    );
    gh.lazySingleton<_i519.AuthenticationRepository>(
      () => _i600.AuthenticationRepositoryImplementation(
        authenticationRemoteDataSource:
            gh<_i542.AuthenticationRemoteDataSource>(),
        authenticationLocalDataSource: gh<_i28.AuthenticationLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i556.LoginUseCase>(
      () => _i556.LoginUseCase(
        authenticationRepository: gh<_i519.AuthenticationRepository>(),
      ),
    );
    gh.factory<_i275.LoginCubit>(
      () => _i275.LoginCubit(loginUseCase: gh<_i556.LoginUseCase>()),
    );
    return this;
  }
}
