import 'dart:ui';

import 'package:flutter/material.dart';

class BottomSheetBackground extends StatelessWidget {
  const BottomSheetBackground({
    super.key,
    this.sigmaXForBackdropFilter,
    this.sigmaYForBackdropFilter,
  });

  final double? sigmaXForBackdropFilter;
  final double? sigmaYForBackdropFilter;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: sigmaXForBackdropFilter ?? 3,
        sigmaY: sigmaYForBackdropFilter ?? 3,
      ),
      child: SizedBox(),
    );
  }
}
