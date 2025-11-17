import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beit_alnakha_admin/config/routes/routes.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';

@injectable
class SideBarCubit extends Cubit<SideBarStates> {
  SideBarCubit() : super(SideBarInitialState());

  static SideBarCubit get(BuildContext context) => BlocProvider.of(context);

  int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.requestsView)) {
      return 0;
    } else if (location.startsWith(Routes.customersView)) {
      return 1;
    } else if (location.startsWith(Routes.driversView)) {
      return 2;
    }else if (location.startsWith(Routes.agentsView)) {
      return 3;
    }else if (location.startsWith(Routes.chefsView)) {
      return 4;
    }else if (location.startsWith(Routes.departmentsView)) {
      return 5;
    }else if (location.startsWith(Routes.mealsView)) {
      return 6;
    }else if (location.startsWith(Routes.featuresView)) {
      return 7;
    }else if (location.startsWith(Routes.codesView)) {
      return 8;
    }else if (location.startsWith(Routes.settingsView)) {
      return 9;
    }
    return 0;
  }

  bool isBottomNavVisible = true;

  void setBottomNavVisible(bool visible) {
    if (isBottomNavVisible != visible) {
      isBottomNavVisible = visible;
      emit(SideBarChangeVisibilityState(visible));
    }
  }

  final List<String> icons = [
    AppAssets.requests,
    AppAssets.customers,
    AppAssets.drivers,
    AppAssets.agents,
    AppAssets.chefs,
    AppAssets.departments,
    AppAssets.meals,
    AppAssets.features,
    AppAssets.codes,
    AppAssets.settings,
  ];
  final List<String> iconsFilled = [
    AppAssets.requestsFill,
    AppAssets.customersFill,
    AppAssets.driversFill,
    AppAssets.agentsFill,
    AppAssets.chefsFill,
    AppAssets.departmentsFill,
    AppAssets.mealsFill,
    AppAssets.featuresFill,
    AppAssets.codesFill,
    AppAssets.settingsFill,
  ];

  final List<String> titles = [
    AppStrings.requests,
    AppStrings.customers,
    AppStrings.drivers,
    AppStrings.agents,
    AppStrings.chefs,
    AppStrings.departments,
    AppStrings.meals,
    AppStrings.features,
    AppStrings.codesAndPoints,
    AppStrings.settings,
  ];

  final routes = [
    Routes.requestsView,
    Routes.customersView,
    Routes.driversView,
    Routes.agentsView,
    Routes.chefsView,
    Routes.departmentsView,
    Routes.mealsView,
    Routes.featuresView,
    Routes.codesView,
    Routes.settingsView
  ];
}
