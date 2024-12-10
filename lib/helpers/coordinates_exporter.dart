import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<void> exportCoordinates(context, coordinatesLog) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/coordinates.txt');
    await file.writeAsString(coordinatesLog.join('\n'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Coordinates saved to ${file.path}')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error saving coordinates: $e')),
    );
  }
}

Future<void> coordinateLog(coordinatesLog) async {
  try {
    for (var log in coordinatesLog) {
      print(log);
    }
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/coordinates_log.txt');
    await file.writeAsString(coordinatesLog.join('\n'));

    print('Coordinates saved to: ${file.path}');
  } catch (e) {
    print('Error saving coordinates: $e');
  }
}
