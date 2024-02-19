import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

class DirectoryPickerButton extends StatefulWidget {
  const DirectoryPickerButton({super.key});

  @override
  _DirectoryPickerButtonState createState() => _DirectoryPickerButtonState();
}

class _DirectoryPickerButtonState extends State<DirectoryPickerButton> {
  String _selectedDirectoryPath = '';

  Future<void> _openDirectoryPicker() async {
    try {
      String? directory = await FlutterDocumentPicker.openDocument(
        params: DocumentParams(
          allowedFileExtensions: [''],
          allowedUris: [],
          allowedMimeTypes: [],
          invalidFileNameSymbols: ['/'],
        ),
      );

      if (directory != null) {
        setState(() {
          _selectedDirectoryPath = directory.path;
        });
      }
    } catch (e) {
      print('Error picking directory: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _openDirectoryPicker,
          child: Text('Open Directory Picker'),
        ),
        SizedBox(height: 20),
        Text('Selected Directory: $_selectedDirectoryPath'),
      ],
    );
  }
}
