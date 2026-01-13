import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaginationNumberWidget extends StatelessWidget {
  final int pageCount;
  final int currentPage;
  final ValueChanged<int> onPageChanged;
  final bool loading;

  const PaginationNumberWidget({
    super.key,
    required this.pageCount,
    required this.currentPage,
    required this.onPageChanged,
    this.loading = false,
  });

  List<Widget> _buildPageNumbers(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List<Widget> widgets = [];
    if (width < ScreenWidthBreakpoints.tablet) {
      if (currentPage < pageCount) {
        widgets.add(_pageButton(context, currentPage + 1));
      }
      widgets.add(_pageButton(context, currentPage));
      if (currentPage > 1) {
        widgets.add(_pageButton(context, currentPage - 1));
      }
    } else {
      int maxPagesToShow = 5;
      int startPage = 1;
      int endPage = pageCount;

      if (pageCount > maxPagesToShow) {
        if (currentPage <= 3) {
          startPage = 1;
          endPage = maxPagesToShow;
        } else if (currentPage >= pageCount - 2) {
          startPage = pageCount - maxPagesToShow + 1;
          endPage = pageCount;
        } else {
          startPage = currentPage - 2;
          endPage = currentPage + 2;
        }
      }

      // Add last page and ellipsis if needed (reversed)
      if (endPage < pageCount) {
        widgets.add(_pageButton(context, pageCount));
        if (endPage < pageCount - 1) {
          widgets.add(
            const Padding(
              padding: EdgeInsets.only(left: AppSize.size8, right: AppSize.size8,bottom: AppSize.size8),
              child: Text('...', style: TextStyle(fontSize: 18)),
            ),
          );
        }
      }

      // Add page buttons in reverse order
      for (int i = endPage; i >= startPage; i--) {
        widgets.add(_pageButton(context, i));
      }

      // Add ellipsis and first page if needed (reversed)
      if (startPage > 1) {
        if (startPage > 2) {
          widgets.add(
            const Padding(
              padding: EdgeInsets.only(left: AppSize.size8, right: AppSize.size8,bottom: AppSize.size8),
              child: Text('...', style: TextStyle(fontSize: 18)),
            ),
          );
        }
        widgets.add(_pageButton(context, 1));
      }
    }
    return widgets;
  }

  Widget _pageButton(BuildContext context, int page) {
    bool isSelected = page == currentPage;
    return Padding(
      padding: const EdgeInsets.all(AppSize.size4),
      child: InkWell(
        radius: AppSize.size50,
        onTap: (isSelected || loading) ? null : () => onPageChanged(page),
        borderRadius: BorderRadius.circular(AppSize.size50),
        child: Container(
          width: AppSize.size45,
          height: AppSize.size45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.yellow3D : Colors.white,
            shape: BoxShape.circle,
            //  borderRadius: BorderRadius.circular(AppSize.size24),
            border: Border.all(
              color: isSelected ? AppColors.yellow3D : AppColors.greyE7,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '$page',
              style: AppStyles.semiBold16(context).copyWith(
                height: 1.35,
                color: isSelected ? Colors.white : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous
        loading
            ? const _LoadingCircle()
            : InkWell(
                onTap: currentPage < pageCount && !loading
                    ? () => onPageChanged(currentPage + 1)
                    : null,

                borderRadius: BorderRadius.circular(AppSize.size24),
                child: Transform.rotate(
                  angle: -3.14,
                  child: ArrowWithCircleWidget(),
                ),
              ),
        const SizedBox(width: AppSize.size8),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              ..._buildPageNumbers(context),
            ],
          ),
        ),
        const SizedBox(width: AppSize.size8),
        // Next
        loading
            ? const _LoadingCircle()
            : InkWell(
                onTap: currentPage > 1 && !loading
                    ? () => onPageChanged(currentPage - 1)
                    : null,
                borderRadius: BorderRadius.circular(AppSize.size24),
                child: ArrowWithCircleWidget(),
              ),
      ],
    );
  }
}

class _LoadingCircle extends StatelessWidget {
  const _LoadingCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.size45,
      height: AppSize.size45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyE7),
      ),
      child: ShimmerCircleAvatarEffect(
        radius: AppSize.size45,
      ),
    );
  }
}

class ArrowWithCircleWidget extends StatelessWidget {
  const ArrowWithCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.size45,
      height: AppSize.size45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyE7),
      ),
      child: SvgPicture.asset(
        AppAssets.arrowRight,
        colorFilter: ColorFilter.mode(AppColors.yellow3D, BlendMode.srcIn),
        height: AppSize.size24,
        width: AppSize.size24,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
