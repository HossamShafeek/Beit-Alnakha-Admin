import 'dart:io';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:beit_alnakha_admin/core/functions/show_toastification_widget.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/check_file_name_is_exist.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/create_excel_file_bytes.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/create_output_path.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/excel_params.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/file_extensions.dart';
import 'package:beit_alnakha_admin/core/helper/export_file/share_file.dart';

class SaveDataInFileAndDownloadIt {
  late String outputPath;
  late File file;

  Future<File> createFile({
    required String fileName,
    required String fileExtension,
  }) async {
    outputPath = await createOutputPath(
      fileName: fileName,
      fileExtension: fileExtension,
    );
    file = await checkFileNameIsExist(
      outputPath: outputPath,
      fileExtension: fileExtension,
    );
    return file;
  }

  Future<void> createExcel({
    required BuildContext context,
    required String fileName,
    required ExcelParams excelParams,
  }) async {
    try {
      await createFile(
        fileExtension: FileExtensions.xlsx.name,
        fileName: fileName,
      );
      if (context.mounted) {
        if (outputPath != 'null') {
          List<int>? excelFileBytes = await createExcelFileBytes(
            excelParams: excelParams,
            context: context,
          );
          if (excelFileBytes != null) {
            file
              ..createSync(recursive: true)
              ..writeAsBytesSync(excelFileBytes);
          }
          if (context.mounted) {
            shareFile(context: context, file: file);
          }
          // if (context.mounted) {
          //   showToastificationWidget(
          //     message: 'تم تنزيل الملف بنجاح',
          //     context: context,
          //     notificationType: ToastificationType.success,
          //   );
          // }
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
