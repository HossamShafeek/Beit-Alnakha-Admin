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

  int currentIndex = 0;

  int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
     currentIndex = routes.indexWhere((route) => location.startsWith(route));
    return currentIndex ;
  }

  bool smallSideBar = false;

  void toggleSideBar() {
    smallSideBar = !smallSideBar;
    emit(ChangeSideBarSizeState());
  }

  final List<String> icons = [
    AppAssets.requests,
    AppAssets.customers,
    AppAssets.drivers,
    AppAssets.agents,
    AppAssets.influencers,
    AppAssets.employees,
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
    AppAssets.influencersFill,
    AppAssets.employeesFill,
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
    AppStrings.influencers,
    AppStrings.employees,
    AppStrings.chefs,
    AppStrings.departments,
    AppStrings.meals,
    AppStrings.features,
    AppStrings.codesAndPoints,
    AppStrings.settings,
  ];

   final List<String> manageTitles = [
    AppStrings.manageRequests,
    AppStrings.manageCustomers,
    AppStrings.manageDrivers,
    AppStrings.manageAgents,
    AppStrings.manageInfluencers,
    AppStrings.manageEmployees,
    AppStrings.manageChefs,
    AppStrings.manageMeals,
    AppStrings.manageFeatures,
    AppStrings.manageCodesAndPoints,
    AppStrings.manageDepartments,
    AppStrings.manageSettings,
  ];

  final List<String> subtitles = [
    AppStrings.requestsDescription,
    AppStrings.customersDescription,
    AppStrings.driversDescription,
    AppStrings.agentsDescription,
    AppStrings.influencersDescription,
    AppStrings.employeesDescription,
    AppStrings.chefsDescription,
    AppStrings.mealsDescription,
    AppStrings.featuresDescription,
    AppStrings.codesAndPointsDescription,
    AppStrings.departmentsDescription,
    AppStrings.settingsDescription,
  ];

  final routes = [
    Routes.requestsView,
    Routes.customersView,
    Routes.driversView,
    Routes.agentsView,
    Routes.influencersView,
    Routes.employeesView,
    Routes.chefsView,
    Routes.departmentsView,
    Routes.mealsView,
    Routes.featuresView,
    Routes.codesView,
    Routes.settingsView,
  ];
}
