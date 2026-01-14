import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:beit_alnakha_admin/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTextsFieldsSection extends StatelessWidget {
  const LoginTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          CustomTextField(
            hoverColor: AppColors.primaryWithOpacity15,
            textStyleColor: AppColors.white,
            hintStyleColor: AppColors.grey88,
            textInputType: TextInputType.emailAddress,
            controller: loginCubit.emailController,
            backgroundColor: AppColors.secondaryBlack,
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                AppAssets.username,
                colorFilter: ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterUsername;
              }
              return null;
            },
            hintText: AppStrings.enterUsername,
          ),
          CustomTextField(
            hoverColor: AppColors.primaryWithOpacity15,

            onFieldSubmitted: (value) {
              if (loginCubit.formKey.currentState!.validate()) {
                loginCubit.login();
              }
            },
            textStyleColor: AppColors.white,
            hintStyleColor: AppColors.grey88,
            passwordVisibilityColor: AppColors.white,
            backgroundColor: AppColors.secondaryBlack,
            textInputType: TextInputType.visiblePassword,
            paddingForBottom: 0,
            obscureText: true,
            enabledPasswordVisibility: true,

            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                AppAssets.lock,
                colorFilter: ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            controller: loginCubit.passwordController,
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterPassword;
              }
              return null;
            },
            hintText: AppStrings.enterPassword,
          ),
        ],
      ),
    );
  }
}
