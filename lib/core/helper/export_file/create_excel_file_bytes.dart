import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:beit_alnakha_admin/core/helper/export_file/excel_params.dart';

Future<List<int>?> createExcelFileBytes({
  required ExcelParams excelParams,
  required BuildContext context,
}) async {
  // إنشاء ملف Excel جديد
  final workbook = xlsio.Workbook();
  final sheet = workbook.worksheets[0];
  sheet.name = 'Sheet1';

  // 🟡 كتابة الأعمدة (العناوين)
  for (var i = 0; i < excelParams.columns.length; i++) {
    final cell = sheet.getRangeByIndex(1, i + 1);
    cell.setText(excelParams.columns[i]);
    cell.cellStyle.bold = true;
    cell.cellStyle.hAlign = xlsio.HAlignType.center;
  }

  // ✍️ كتابة الصفوف (البيانات)
  for (var rowIndex = 0; rowIndex < excelParams.rows.length; rowIndex++) {
    final row = excelParams.rows[rowIndex];
    for (var colIndex = 0; colIndex < row.length; colIndex++) {
      final value = row[colIndex];
      final cell = sheet.getRangeByIndex(rowIndex + 2, colIndex + 1);

      if (value is int) {
        cell.setNumber(value.toDouble());
      } else if (value is double) {
        cell.setNumber(value);
      } else if (value is bool) {
        cell.setText(value ? 'True' : 'False');
      } else {
        cell.setText(value.toString());
      }

      cell.cellStyle.hAlign = xlsio.HAlignType.center;
    }
  }

  // 🪄 ضبط عرض الأعمدة تلقائيًا حسب أكبر محتوى
  for (var i = 0; i < excelParams.columns.length; i++) {
    sheet.autoFitColumn(i + 1);
  }

  // 📝 حفظ الملف في الذاكرة
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  return Uint8List.fromList(bytes);
}
