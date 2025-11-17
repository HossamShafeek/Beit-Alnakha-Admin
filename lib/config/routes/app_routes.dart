import 'package:beit_alnakha_admin/features/Requests/presentation/views/requests_view.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_cubit.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/views/shell_route.dart';
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
              child: const RequestsView(),
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
