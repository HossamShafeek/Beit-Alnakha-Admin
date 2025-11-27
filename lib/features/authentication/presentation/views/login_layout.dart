import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:beit_alnakha_admin/config/routes/routes.dart';
import 'package:beit_alnakha_admin/core/functions/show_toastification_widget.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_full_loading.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/cubits/login_cubit/login_states.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/views/login_view_desktop.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/views/login_view_mobile.dart';
import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          showToastificationWidget(
            context: context,
            message: state.error,
            notificationType: ToastificationType.error,
          );
        } else if (state is LoginSuccessState) {
          context.goNamed(Routes.requestsView);
          showToastificationWidget(
            context: context,
            message:
                state.authenticationModel.message ??
                AppStrings.loggedInSuccessfully,
          );
        }
      },
      builder: (context, state) {
        return CustomFullLoading(
          isLoading: state is LoginLoadingState,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColors.primaryBlack,
            body: AdaptiveLayout(
              mobileLayout: (context) => const LoginViewMobile(),
              tabletLayout: (context) => const LoginViewMobile(
                horizontalPadding:
                    AppSize.size100, // Adjust padding for tablet view
              ),
              desktopLayout: (context) => const LoginViewDesktop(),
            ),
          ),
        );
      },
    );
  }
}
