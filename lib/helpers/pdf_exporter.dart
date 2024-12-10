import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nuwa/helpers/sketch_painter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:ui' as ui;

Future<void> exportToPDF(context, points) async {
  try {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 500, 500));
    final painter = Painter(points);
    painter.paint(canvas, const Size(500, 500));
    final picture = recorder.endRecording();
    final image = await picture.toImage(500, 500);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Image(pw.MemoryImage(pngBytes));
      },
    ));

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/drawing.pdf');
    await file.writeAsBytes(await pdf.save());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved to ${file.path}')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error exporting to PDF: $e')),
    );
  }
}
