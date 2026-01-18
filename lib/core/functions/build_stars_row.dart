import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildStarsRow(double count) {
  return  RatingBar.builder(
    initialRating: count,
    minRating: 1,
    ignoreGestures: true,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemSize: AppSize.size24,
    unratedColor: AppColors.grey400,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => SvgPicture.asset(
      AppAssets.star,
      colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
    ),
    onRatingUpdate: (rating) {},
  );
}