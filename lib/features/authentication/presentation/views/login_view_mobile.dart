import 'package:beit_alnakha_admin/config/routes/routes.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_elevated_button.dart';
import 'package:beit_alnakha_admin/core/widgets/logo_widget.dart';
import 'package:flutter/services.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/cubits/login_cubit/login_states.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/widgets/login_texts_fields_section.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/widgets/title_and_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginViewMobile extends StatelessWidget {
  const LoginViewMobile({super.key, this.horizontalPadding});

  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: AppConstants.systemUiOverlayStyleDark.copyWith(
            statusBarColor: AppColors.loginBackgroundColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: AppSize.size16,
                top: AppSize.size16,
              ),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: AppSize.size72,
                      children: [
                        LogoWidget(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: horizontalPadding ?? AppSize.size16,
                            right: horizontalPadding ?? AppSize.size16,
                            bottom: AppSize.size50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (context.width < ScreenWidthBreakpoints.desktop) ...{
                                const Gap(AppSize.size8),
                              } else ...{
                                const Gap(AppSize.size16),
                              },
                              const TitleAndSubtitle(
                                title: AppStrings.loginTitle,
                                subtitle: AppStrings.loginSubtitle,
                              ),
                              const Gap(AppSize.size40),
                              const LoginTextsFieldsSection(),
                              const Gap(AppSize.size32),
                              CustomElevatedButton(
                                title: AppStrings.login,
                                onPressed: () {
                                  if (loginCubit.formKey.currentState!.validate()) {
                                    context.goNamed(Routes.requestsView);
                                  }
                                },
                              ),
                              const Gap(AppSize.size16),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
