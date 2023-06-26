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
                        setState(
                          () => {
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
                                    for (Data rowElement in row)
                                      {
                                        debugPrint(
                                          'cellIndex: ${rowElement.cellIndex}, cellData: ${rowElement.value}',
                                        ),
                                      }
                                  },
                              },
                          },
                        ),
                      }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Load data from a .xlsx file',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, listItemIndex) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlue[100],
                            ),
                            child: Icon(
                              Icons.directions_car,
                              size: 28,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
