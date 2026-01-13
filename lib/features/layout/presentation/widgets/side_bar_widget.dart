import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_button.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_cubit.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_states.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/widgets/logout_sid_bar.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/widgets/side_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:beit_alnakha_admin/core/animations/slide_transition_animation.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/logo_widget.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  void closeSideBar(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (AppConstants.layoutKey.currentState!.isDrawerOpen &&
          context.width > ScreenWidthBreakpoints.tablet) {
        AppConstants.layoutKey.currentState!.closeDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideBarCubit, SideBarStates>(
      builder: (context, state) {
        // Close SideBar
        closeSideBar(context);
        SideBarCubit sideBarCubit = context.read<SideBarCubit>();
        bool isSmallScreen = context.width < 1200;
        return SlideTransitionAnimation(
          duration: const Duration(milliseconds: 500),
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            width:
                (sideBarCubit.smallSideBar || isSmallScreen) &&
                    !AppConstants.layoutKey.currentState!.isDrawerOpen
                ? 90
                : 280,
            height: double.infinity,
            color: AppColors.black,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.black,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 80,
                  title: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: AppSize.size20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if ((!sideBarCubit.smallSideBar && !isSmallScreen) ||
                            AppConstants
                                .layoutKey
                                .currentState!
                                .isDrawerOpen) ...[
                          Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  child: LogoWidget(size: 50, withBorder: true),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                        if (isSmallScreen &&
                            !AppConstants
                                .layoutKey
                                .currentState!
                                .isDrawerOpen) ...[
                          LogoWidget(size: 50, withBorder: true),
                        ],
                        if (!isSmallScreen ||
                            AppConstants
                                .layoutKey
                                .currentState!
                                .isDrawerOpen) ...[
                          CustomContainerButton(
                            imagePath:
                                AppConstants
                                    .layoutKey
                                    .currentState!
                                    .isDrawerOpen
                                ? AppAssets.close
                                : AppAssets.menu,
                            iconColor: AppColors.white,
                            onTap: () {
                              if (AppConstants
                                  .layoutKey
                                  .currentState!
                                  .isDrawerOpen) {
                                AppConstants.layoutKey.currentState
                                    ?.closeDrawer();
                              } else {
                                sideBarCubit.toggleSideBar();
                              }
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(child: Gap(AppSize.size12)),
                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: sideBarCubit.titles.length,
                    itemBuilder: (context, index) {
                      final lastItemIndex = sideBarCubit.titles.length - 1;
                      final shouldShowDivider = index == lastItemIndex;
                      return Column(
                        children: [
                          if (shouldShowDivider)
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.greyAA,
                            ),
                          SideBarItem(
                            title: sideBarCubit.titles[index],
                            icon: sideBarCubit.getCurrentIndex(context) == index
                                ? sideBarCubit.iconsFilled[index]
                                : sideBarCubit.icons[index],
                            smallSideBar:
                                (sideBarCubit.smallSideBar || isSmallScreen) &&
                                !AppConstants
                                    .layoutKey
                                    .currentState!
                                    .isDrawerOpen,
                            isLastItem: shouldShowDivider,
                            isActive:
                                sideBarCubit.getCurrentIndex(context) == index,
                            onTap: () {
                              context.goNamed(sideBarCubit.routes[index]);
                              if (AppConstants
                                  .layoutKey
                                  .currentState!
                                  .isDrawerOpen) {
                                AppConstants.layoutKey.currentState!
                                    .closeDrawer();
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: LogoutSidBar(
                    smallSideBar:
                        (sideBarCubit.smallSideBar || isSmallScreen) &&
                        !AppConstants.layoutKey.currentState!.isDrawerOpen,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
