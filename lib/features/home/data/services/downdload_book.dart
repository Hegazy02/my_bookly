// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/widgets/diolog.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class DownLoadBook {
  Future<String> downloadFile(
      {required BuildContext context,
      required String url,
      required String fileName}) async {
    HttpClient httpClient = HttpClient();
    File file;
    String filePath = '';

    try {
      BooklyDiolog().customDiolog(
          context: context, child: const CircularProgressIndicator());
      await createAppNameFolder();
      await getApplicationDocumentsDirectory().then((value) {
        filePath = "${value.path}/${MyConstants.KappName}/$fileName";
      });

      if (await isFileExists(filePath: filePath)) {
        Navigator.of(context).pop();
        BooklyDiolog().titleWithOneButton(
          context: context,
          title: 'This book is already exists',
          fileName: fileName,
          onPressed: () {
            OpenAppFile.open(filePath);
            Navigator.of(context).pop();
          },
        );
      } else {
        var request = await httpClient.getUrl(Uri.parse(url));
        var response = await request.close();
        if (response.statusCode == 200) {
          var bytes = await consolidateHttpClientResponseBytes(response);

          file = File(filePath);
          await file.writeAsBytes(bytes);
          Navigator.of(context).pop();
          BooklyDiolog().titleWithOneButton(
            context: context,
            title: 'Book has been downloaded successfully',
            fileName: fileName,
            onPressed: () {
              OpenAppFile.open(filePath);
              Navigator.of(context).pop();
            },
          );
        } else {
          filePath = 'Error: ${response.statusCode}';
        }
      }
    } catch (ex) {
      filePath = 'Cannot fetch Url';
      Navigator.of(context).pop();
      BooklyDiolog().titleWithOneButton(
        context: context,
        title: filePath,
        buttonText: 'Back',
        fileName: 'Error',
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
    }

    return filePath;
  }

  Future<void> createAppNameFolder() async {
    String path = '';

    await getApplicationDocumentsDirectory().then((value) {
      path = '${value.path}/${MyConstants.KappName}/';
    });

    final Directory appDocDirFolder = Directory(path);

    if (!await appDocDirFolder.exists()) {
      await appDocDirFolder.create(recursive: true);
    }
  }

  Future<bool> isFileExists({required String filePath}) async {
    File file = File(filePath);

    return await file.exists();
  }

  String getFileName(String url) {
    RegExp regExp = RegExp(r'.+(\/|%2F)(.+)\?.+');
    //This Regex won't work if you remove ?alt...token
    var matches = regExp.allMatches(url);

    var match = matches.elementAt(0);

    return Uri.decodeFull(match.group(2)!);
  }
}
