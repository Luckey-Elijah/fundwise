import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:http/http.dart' as http;
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart';

final logger = Logger();

void main() async {
  var progress = logger.progress('getting pocketbase releases');
  try {
    final releaseUri = Uri.parse(
      'https://api.github.com/repos/pocketbase/pocketbase/releases/latest',
    );
    final latestRelease = await http.get(
      releaseUri,
    );

    final json = jsonDecode(latestRelease.body);
    if (json case {'assets': final List<dynamic> releaseAssets}) {
      progress.complete();
      final assets = releaseAssets
          .cast<Map<String, dynamic>>()
          .map(PbReleaseAsset.new)
          .where((e) => e.contentType == 'application/zip')
          .toList();
      final download = logger.chooseOne(
        'Select you installation',
        choices: assets,
        display: (choice) => '${choice.name}',
      );

      progress = logger.progress('downloading ${download.name}');
      final results = await http.get(Uri.parse('${download.url}'));
      progress.update('writing ${download.name} to server/');

      for (final file in ZipDecoder().decodeBytes(results.bodyBytes)) {
        if (file.isFile && file.name.contains('pocketbase')) {
          final path = join(
            Directory(Platform.script.path).parent.parent.path,
            'server',
            file.name,
          );
          progress.update('writing $path');
          File(path)
            ..createSync(recursive: true)
            ..writeAsBytesSync(file.content as List<int>);
        }
      }
      progress.complete();
    } else {
      throw Exception('no [assets] found in response from $releaseUri');
    }
  } catch (e, s) {
    progress
      ..fail('$e')
      ..fail('\n')
      ..fail('$s');
  }
}

extension type PbReleaseAsset(Map<String, dynamic> json) {
  dynamic get contentType => json['content_type'];
  dynamic get name => json['name'];
  dynamic get url => json['browser_download_url'];
}
