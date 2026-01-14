import 'package:beit_alnakha_admin/features/agents/presentation/views/agent_details_layout.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/views/agents_layout.dart';
import 'package:beit_alnakha_admin/features/chefs/presentation/views/chefs_layout.dart';
import 'package:beit_alnakha_admin/features/codes/presentation/views/codes_view.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/views/customer_details_layout.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/views/customers_layout.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/views/departments_view.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/views/driver_details_layout.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/views/drivers_layout.dart';
import 'package:beit_alnakha_admin/features/employees/presentation/views/employees_layout.dart';
import 'package:beit_alnakha_admin/features/features/presentation/views/features_view.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/views/influencers_layout.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/views/influencer_details_layout.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_cubit.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/views/shell_route.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/views/meals_view.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/views/requests_details_layout.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/views/requests_layout.dart';
import 'package:beit_alnakha_admin/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:beit_alnakha_admin/config/routes/routes.dart';
import 'package:beit_alnakha_admin/core/animations/page_fade_transition.dart';
import 'package:beit_alnakha_admin/core/dependency_injection/injectable_config.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/views/login_layout.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: () {
    if (AppConstants.accessToken.isEmpty) {
      return Routes.loginView;
    } else {
      return Routes.requestsView;
    }
  }(),
  routes: [
    GoRoute(
      path: Routes.loginView,
      name: Routes.loginView,
      pageBuilder: (context, state) {
        return PageFadeTransitionRouter(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => getIt.get<LoginCubit>(),
            child: const LoginLayout(),
          ),
        );
      },
    ),

    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt.get<SideBarCubit>()),
          ],
          child: ShellRout(child: child),
        );
      },
      routes: [
        GoRoute(
          path: Routes.requestsView,
          name: Routes.requestsView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const RequestsLayout(),
            );
          },
          routes: [
            GoRoute(
              path: '${Routes.requestDetailsView}/:requestId',
              name: Routes.requestDetailsView,
              pageBuilder: (context, state) {
                String requestId = state.pathParameters['requestId'] ?? '';
                return _buildPageWithSlideTransition(
                  context: context,
                  state: state,
                  child: RequestsDetailsLayout(requestId: requestId),
                );
              },
            ),
          ],
        ),

        GoRoute(
          path: Routes.customersView,
          name: Routes.customersView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const CustomersView(),
            );
          },
          routes: [
            GoRoute(
              path: '${Routes.customerDetailsView}/:customerId',
              name: Routes.customerDetailsView,
              pageBuilder: (context, state) {
                String customerId = state.pathParameters['customerId'] ?? '';
                return _buildPageWithSlideTransition(
                  context: context,
                  state: state,
                  child: CustomerDetailsLayout(customerId: customerId),
                );
              },
            ),
          ],
        ),

        GoRoute(
          path: Routes.driversView,
          name: Routes.driversView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const DriversLayout(),
            );
          },
          routes: [
            GoRoute(
              path: '${Routes.driverDetailsView}/:driverId',
              name: Routes.driverDetailsView,
              pageBuilder: (context, state) {
                String driverId = state.pathParameters['driverId'] ?? '';
                return _buildPageWithSlideTransition(
                  context: context,
                  state: state,
                  child: DriverDetailsLayout(driverId: driverId),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.agentsView,
          name: Routes.agentsView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const AgentsLayout(),
            );
          },
          routes: [
            GoRoute(
              path: '${Routes.agentDetailsView}/:agentId',
              name: Routes.agentDetailsView,
              pageBuilder: (context, state) {
                String agentId = state.pathParameters['agentId'] ?? '';
                return _buildPageWithSlideTransition(
                  context: context,
                  state: state,
                  child: AgentDetailsLayout(agentId: agentId),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.influencersView,
          name: Routes.influencersView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const InfluencersLayout(),
            );
          },
          routes: [
            GoRoute(
              path: '${Routes.influencerDetailsView}/:influencerId',
              name: Routes.influencerDetailsView,
              pageBuilder: (context, state) {
                String influencerId =
                    state.pathParameters['influencerId'] ?? '';
                return _buildPageWithSlideTransition(
                  context: context,
                  state: state,
                  child: InfluencerDetailsLayout(influencerId: influencerId),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.employeesView,
          name: Routes.employeesView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const EmployeesLayout(),
            );
          },
          routes: [
            // GoRoute(
            //   path: '${Routes.employeeDetailsView}/:employeeId',
            //   name: Routes.employeeDetailsView,
            //   pageBuilder: (context, state) {
            //     String employeeId =
            //         state.pathParameters['employeeId'] ?? '';
            //     return _buildPageWithSlideTransition(
            //       context: context,
            //       state: state,
            //       child: InfluencerDetailsLayout(influencerId: employeeId),
            //     );
            //   },
            // ),
          ],
        ),
        GoRoute(
          path: Routes.chefsView,
          name: Routes.chefsView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const ChefsLayout(),
            );
          },
        ),
        GoRoute(
          path: Routes.departmentsView,
          name: Routes.departmentsView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const DepartmentsView(),
            );
          },
        ),
        GoRoute(
          path: Routes.mealsView,
          name: Routes.mealsView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const MealsView(),
            );
          },
        ),
        GoRoute(
          path: Routes.featuresView,
          name: Routes.featuresView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const FeaturesView(),
            );
          },
        ),
        GoRoute(
          path: Routes.codesView,
          name: Routes.codesView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const CodesView(),
            );
          },
        ),
        GoRoute(
          path: Routes.settingsView,
          name: Routes.settingsView,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: const SettingsView(),
            );
          },
        ),
      ],
    ),
  ],
);

CustomTransitionPage<void> _buildPageWithSlideTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  TextDirection? textDirection,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,

    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const slideBegin = Offset(1.0, 0.0);
      const slideEnd = Offset.zero;
      const slideCurve = Curves.easeOutCubic;
      var slideTween = Tween(
        begin: slideBegin,
        end: slideEnd,
      ).chain(CurveTween(curve: slideCurve));
      var slideAnimation = animation.drive(slideTween);

      const fadeBegin = 1.0;
      const fadeEnd = 0.0;
      var fadeOutTween = Tween(
        begin: fadeBegin,
        end: fadeEnd,
      ).chain(CurveTween(curve: Curves.easeOutCubic));
      var fadeOutAnimation = secondaryAnimation.drive(fadeOutTween);

      return AnimatedBuilder(
        animation: secondaryAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: fadeOutAnimation,
            child: SlideTransition(
              textDirection: textDirection ?? TextDirection.rtl,
              position: slideAnimation,
              child: child!,
            ),
          );
        },
        child: child,
      );
    },
  );
}
