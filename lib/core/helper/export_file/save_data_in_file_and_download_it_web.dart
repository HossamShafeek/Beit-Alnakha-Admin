import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:beit_alnakha_admin/core/functions/show_toastification_widget.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/create_excel_file_bytes.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/excel_params.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/file_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';

class SaveDataInFileAndDownloadIt {
  Future<void> createFile({
    required String fileExtension,
    required String fileName,
    required dynamic content,
  }) async {
    final fileNameWithExtension = '$fileName.$fileExtension';
    final blob = html.Blob([content]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor =
        html.AnchorElement(href: url)
          ..setAttribute("download", fileNameWithExtension)
          ..click();
    html.Url.revokeObjectUrl(url);
  }

  Future<void> createExcel({
    required BuildContext context,
    required String fileName,
    required ExcelParams excelParams,
  }) async {
    try {
      // حفظ الملف على الويب
      List<int>? excelFileBytes = await createExcelFileBytes(
        excelParams: excelParams,
        context: context,
      );
      if (excelFileBytes != null) {
        await createFile(
          fileName: fileName,
          fileExtension: FileExtensions.xlsx.name,
          content: excelFileBytes,
        );
        if (context.mounted) {
          showToastificationWidget(
            message: AppStrings.downloadedSuccessfully,
            context: context,
            notificationType: ToastificationType.success,
          );
        }
      }
    } catch (error) {
      if (context.mounted) {
        showToastificationWidget(
          message: error.toString(),
          context: context,
          notificationType: ToastificationType.error,
        );
      }
    }
  }

}
