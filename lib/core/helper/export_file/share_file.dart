import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:beit_alnakha_admin/core/functions/show_toastification_widget.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';

void shareFile({required BuildContext context, required File file}) {
  ShareParams shareParams = ShareParams(files: [XFile(file.path)]);
  if (Platform.isAndroid || Platform.isIOS) {
    SharePlus.instance.share(shareParams);
  }
  if (context.mounted) {
    showToastificationWidget(
      message: AppStrings.downloadedSuccessfullyInPath+file.path,
      context: context,
    );
  }
}
