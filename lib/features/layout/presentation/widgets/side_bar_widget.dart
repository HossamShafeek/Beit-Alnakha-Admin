import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_cubit.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_states.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/widgets/logout_sid_bar.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/widgets/side_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:beit_alnakha_admin/core/animations/slide_transition_animation.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/logo_widget.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideBarCubit, SideBarStates>(
      builder: (context, state) {
        SideBarCubit sideBarCubit = context.read<SideBarCubit>();
        bool smallSideBar = context.width < 12;
        return SlideTransitionAnimation(
          duration: const Duration(milliseconds: 500),
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            width: smallSideBar ? 90 : 280,
            height: double.infinity,
            color: AppColors.secondaryBlack,

            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.secondaryBlack,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 80,
                  title: Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical:  AppSize.size20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!smallSideBar) ...{},
                        Center(child: LogoWidget(size: 50, withBorder: true)),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: Gap(AppSize.size12),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: sideBarCubit.titles.length,
                    itemBuilder: (context, index) {
                      final titles = sideBarCubit.titles;
                      final icons = sideBarCubit.icons;
                      final routes = sideBarCubit.routes;
                      final lastItemIndex = titles.length - 1;
                      final shouldShowDivider = index == lastItemIndex;
                      return Column(
                        children: [
                          if (shouldShowDivider)
                            const Divider(height: 1, thickness: 1, color: AppColors.greyAA),
                          SideBarItem(
                            title: titles[index],
                            icon: icons[index],
                            smallSideBar: smallSideBar,
                            isLastItem: shouldShowDivider,
                            isActive:
                                sideBarCubit.getCurrentIndex(context) == index,
                            onTap: () => context.goNamed(routes[index]),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: LogoutSidBar(smallSideBar: smallSideBar),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
