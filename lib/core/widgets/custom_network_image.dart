import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? borderRadius;
  final String image;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomNetworkImage({
    super.key,
    this.borderRadius,
    required this.image,
    this.backgroundColor,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? AppSize.size12),
        color: backgroundColor ?? AppColors.white,
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: fit ?? BoxFit.cover,
        height: double.infinity,
        // memCacheHeight: 300,
        // memCacheWidth: 200,
        // maxHeightDiskCache: 600,
        // maxWidthDiskCache: 400,
        errorWidget: (context, url, error) => ColoredBox(
          color: backgroundColor ?? AppColors.white,
          child: Image.asset(AppAssets.emptyImage),
        ),
      ),
    );
  }
}
