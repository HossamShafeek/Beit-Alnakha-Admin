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
import 'package:beit_alnakha_admin/features/departments/data/data_sources/department_data_source.dart'
    as _i634;
import 'package:beit_alnakha_admin/features/departments/data/repo/department_repo_impl.dart'
    as _i1008;
import 'package:beit_alnakha_admin/features/departments/domain/repo/department_repo.dart'
    as _i724;
import 'package:beit_alnakha_admin/features/departments/domain/use_cases/delete_department_use_case.dart'
    as _i96;
import 'package:beit_alnakha_admin/features/departments/domain/use_cases/edit_department_use_case.dart'
    as _i785;
import 'package:beit_alnakha_admin/features/departments/domain/use_cases/get_all_department_use_case.dart'
    as _i140;
import 'package:beit_alnakha_admin/features/departments/domain/use_cases/get_single_department_use_case.dart'
    as _i831;
import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_cubit.dart'
    as _i1029;
import 'package:beit_alnakha_admin/features/locations/data/data_sources/city_data_source.dart'
    as _i145;
import 'package:beit_alnakha_admin/features/locations/data/data_sources/region_data_source.dart'
    as _i122;
import 'package:beit_alnakha_admin/features/locations/domain/repo/city_repo.dart'
    as _i603;
import 'package:beit_alnakha_admin/features/locations/domain/repo/region_repo.dart'
    as _i927;
import 'package:beit_alnakha_admin/features/locations/domain/use_cases/city_use_cases/edit_city_use_case.dart'
    as _i894;
import 'package:beit_alnakha_admin/features/locations/domain/use_cases/city_use_cases/get_all_city_use_case.dart'
    as _i693;
import 'package:beit_alnakha_admin/features/locations/domain/use_cases/city_use_cases/get_single_city_use_case.dart'
    as _i103;
import 'package:beit_alnakha_admin/features/locations/domain/use_cases/city_use_cases/remove_city_use_case.dart'
    as _i893;
import 'package:beit_alnakha_admin/features/locations/domain/use_cases/region_use_cases/edit_region_use_case.dart'
    as _i905;
import 'package:beit_alnakha_admin/features/locations/domain/use_cases/region_use_cases/get_all_region_use_case.dart'
    as _i607;
import 'package:beit_alnakha_admin/features/locations/domain/use_cases/region_use_cases/get_single_region_use_case.dart'
    as _i558;
import 'package:beit_alnakha_admin/features/locations/domain/use_cases/region_use_cases/remove_region_use_case.dart'
    as _i60;
import 'package:beit_alnakha_admin/features/sliders/data/data_sources/slider_data_source.dart'
    as _i123;
import 'package:beit_alnakha_admin/features/sliders/data/repo/slider_repo_impl.dart'
    as _i687;
import 'package:beit_alnakha_admin/features/sliders/domain/repo/slider_repo.dart'
    as _i223;
import 'package:beit_alnakha_admin/features/sliders/domain/use_cases/slider_use_cases/create_slider_use_case.dart'
    as _i411;
import 'package:beit_alnakha_admin/features/sliders/domain/use_cases/slider_use_cases/edit_slider_use_case.dart'
    as _i661;
import 'package:beit_alnakha_admin/features/sliders/domain/use_cases/slider_use_cases/get_all_sliders_use_case.dart'
    as _i621;
import 'package:beit_alnakha_admin/features/sliders/domain/use_cases/slider_use_cases/get_slider_by_id_use_case.dart'
    as _i491;
import 'package:beit_alnakha_admin/features/sliders/domain/use_cases/slider_use_cases/remove_slider_use_case.dart'
    as _i394;
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
    gh.lazySingleton<_i96.DeleteDepartmentUseCase>(
      () => _i96.DeleteDepartmentUseCase(
        departmentRepo: gh<_i724.DepartmentRepo>(),
      ),
    );
    gh.lazySingleton<_i785.EditDepartmentUseCase>(
      () => _i785.EditDepartmentUseCase(
        departmentRepo: gh<_i724.DepartmentRepo>(),
      ),
    );
    gh.lazySingleton<_i140.GetAllDepartmentUseCase>(
      () => _i140.GetAllDepartmentUseCase(
        departmentRepo: gh<_i724.DepartmentRepo>(),
      ),
    );
    gh.lazySingleton<_i831.GetSingleDepartmentUseCase>(
      () => _i831.GetSingleDepartmentUseCase(
        departmentRepo: gh<_i724.DepartmentRepo>(),
      ),
    );
    gh.lazySingleton<_i28.AuthenticationLocalDataSource>(
      () => _i28.AuthenticationLocalDataSourcesImplementation(),
    );
    gh.lazySingleton<_i905.EditRegionUseCase>(
      () => _i905.EditRegionUseCase(regionRepo: gh<_i927.RegionRepo>()),
    );
    gh.lazySingleton<_i607.GetAllRegionUseCase>(
      () => _i607.GetAllRegionUseCase(regionRepo: gh<_i927.RegionRepo>()),
    );
    gh.lazySingleton<_i558.GetSingleRegionUseCase>(
      () => _i558.GetSingleRegionUseCase(regionRepo: gh<_i927.RegionRepo>()),
    );
    gh.lazySingleton<_i60.RemoveRegionUseCase>(
      () => _i60.RemoveRegionUseCase(regionRepo: gh<_i927.RegionRepo>()),
    );
    gh.lazySingleton<_i738.ApiServices>(
      () => _i505.ApiServicesImplementation(gh<_i463.AppInterceptors>()),
    );
    gh.lazySingleton<_i894.EditCityUseCase>(
      () => _i894.EditCityUseCase(cityRepo: gh<_i603.CityRepo>()),
    );
    gh.lazySingleton<_i693.GetAllCityUseCase>(
      () => _i693.GetAllCityUseCase(cityRepo: gh<_i603.CityRepo>()),
    );
    gh.lazySingleton<_i103.GetSingleCityUseCase>(
      () => _i103.GetSingleCityUseCase(cityRepo: gh<_i603.CityRepo>()),
    );
    gh.lazySingleton<_i893.RemoveCityUseCase>(
      () => _i893.RemoveCityUseCase(cityRepo: gh<_i603.CityRepo>()),
    );
    gh.lazySingleton<_i122.RegionDataSource>(
      () => _i122.RegionDataSourceImpl(apiServices: gh<_i738.ApiServices>()),
    );
    gh.lazySingleton<_i634.DepartmentDataSource>(
      () =>
          _i634.DepartmentDataSourceImpl(apiServices: gh<_i738.ApiServices>()),
    );
    gh.lazySingleton<_i542.AuthenticationRemoteDataSource>(
      () => _i542.AuthenticationRemoteDataSourceImplementation(
        apiServices: gh<_i738.ApiServices>(),
      ),
    );
    gh.lazySingleton<_i123.SliderDataSource>(
      () => _i123.SliderDataSourceImpl(apiServices: gh<_i738.ApiServices>()),
    );
    gh.lazySingleton<_i145.CityDataSource>(
      () => _i145.CityDataSourceImpl(apiServices: gh<_i738.ApiServices>()),
    );
    gh.lazySingleton<_i1008.DepartmentRepoImpl>(
      () => _i1008.DepartmentRepoImpl(
        departmentDataSource: gh<_i634.DepartmentDataSource>(),
      ),
    );
    gh.lazySingleton<_i519.AuthenticationRepository>(
      () => _i600.AuthenticationRepositoryImplementation(
        authenticationRemoteDataSource:
            gh<_i542.AuthenticationRemoteDataSource>(),
        authenticationLocalDataSource: gh<_i28.AuthenticationLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i223.SliderRepo>(
      () =>
          _i687.SliderRepoImpl(sliderDataSource: gh<_i123.SliderDataSource>()),
    );
    gh.lazySingleton<_i411.CreateSliderUseCase>(
      () => _i411.CreateSliderUseCase(sliderRepo: gh<_i223.SliderRepo>()),
    );
    gh.lazySingleton<_i661.EditSliderUseCase>(
      () => _i661.EditSliderUseCase(sliderRepo: gh<_i223.SliderRepo>()),
    );
    gh.lazySingleton<_i621.GetAllSlidersUseCase>(
      () => _i621.GetAllSlidersUseCase(sliderRepo: gh<_i223.SliderRepo>()),
    );
    gh.lazySingleton<_i491.GetSliderByIdUseCase>(
      () => _i491.GetSliderByIdUseCase(sliderRepo: gh<_i223.SliderRepo>()),
    );
    gh.lazySingleton<_i394.RemoveSliderUseCase>(
      () => _i394.RemoveSliderUseCase(sliderRepo: gh<_i223.SliderRepo>()),
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
