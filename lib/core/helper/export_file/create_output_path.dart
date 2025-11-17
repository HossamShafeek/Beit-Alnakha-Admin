import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> createOutputPath({
  required String fileName,
  required String fileExtension,
}) async {
  String outputPath ='';
  final fileNameWithExtension = '$fileName.$fileExtension';
  if (Platform.isAndroid) {
    await Permission.storage.request();
    //if (!status.isGranted) return ;
    Directory docsDir = await getApplicationDocumentsDirectory();
    outputPath = '${docsDir.path}/$fileNameWithExtension';
  } else if (Platform.isIOS) {
    Directory docsDir = await getApplicationDocumentsDirectory();
    outputPath = '${docsDir.path}/$fileNameWithExtension';
  } else {
    // ✅ فتح Dialog لاختيار مكان الحفظ (فقط على Desktop)
    outputPath = await FilePicker.platform.saveFile(
      dialogTitle: 'Choose a save location',
      fileName: fileNameWithExtension,
      type: FileType.custom,
      allowedExtensions: [fileExtension],
    )??'null';
  }
  // check Extension File is exists
  if(outputPath!='null') {
    if (!outputPath.toLowerCase().endsWith('.$fileExtension')) {
      outputPath += '.$fileExtension';
    }
  }
  return outputPath;
}