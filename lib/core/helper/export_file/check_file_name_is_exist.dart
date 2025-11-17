import 'dart:io';

Future<File> checkFileNameIsExist({
  required String outputPath,
  required String fileExtension,
})async{
  File file = File(outputPath);
  String baseName = outputPath.replaceAll(
    RegExp(r'\.' + RegExp.escape(fileExtension) + r'$'),
    '',
  );
  String extension = '.$fileExtension';
  int counter = 1;
  // هنا بنعدل اسم الملف مباشرة دون محاولة فتحه
  while (await file.exists()) {
    outputPath = '${baseName}_$counter$extension';
    file = File(outputPath); // نحدث المسار بالاسم الجديد
    counter++;
  }
  return file;
}