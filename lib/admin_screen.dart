import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    // var recordsFile = File('assets/parking_records.xlsx').readAsBytesSync();
    // var excelData = Excel.decodeBytes(recordsFile);
    // for (var table in excelData.tables.keys) {
    //   print(table); //sheet Name
    //   print(excelData.tables[table]?.maxCols);
    //   print(excelData.tables[table]?.maxRows);
    //   for (var row in excelData.tables[table]!.rows) {
    //     print('$row');
    //   }
    // }

    FilePickerResult? filePickerResult;
    var file;
    var bytes;
    var excel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.green,
              child: InkWell(
                onTap: () async => {
                  filePickerResult = await FilePicker.platform.pickFiles(
                    withData: true,
                    type: FileType.custom,
                    allowedExtensions: ['xlsx'],
                    allowMultiple: false,
                  ),
                  if (filePickerResult != null)
                    {
                      debugPrint('File Picker Result: $filePickerResult'),
                      file = File(filePickerResult!.files.single.path as String),
                      bytes = filePickerResult?.files.single.bytes,
                      excel = Excel.decodeBytes(bytes!),
                      for (var table in excel.tables.keys)
                        {
                          // debugPrint(table),
                          // debugPrint(excel.tables[table].maxCols),
                          // debugPrint(excel.tables[table].maxRows),
                          for (var row in excel.tables[table].rows)
                            {
                              debugPrint('$row'),
                            }
                        }
                    }
                },
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Load .xlsx File',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
