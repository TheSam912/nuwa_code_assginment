import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nuwa/widgets/title_button_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../helpers/sketch_painter.dart';

class DrawingBox extends StatefulWidget {
  const DrawingBox({Key? key}) : super(key: key);

  @override
  State<DrawingBox> createState() => _DrawingBoxState();
}

class _DrawingBoxState extends State<DrawingBox> {
  final List<Offset> points = [];
  final List<String> coordinatesLog = [];

  void clearCanvas() {
    setState(() {
      points.clear();
      coordinatesLog.clear();
    });
  }

  Future<void> exportToPDF() async {
    try {
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 500, 500));
      final painter = SketchPainter(points);
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

  Future<void> exportCoordinates() async {
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

  void onPanUpdate(DragUpdateDetails details) {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.globalToLocal(details.globalPosition);
    final time = DateTime.now().millisecondsSinceEpoch;
    setState(() {
      points.add(offset);
      coordinatesLog.add('x: ${offset.dx}, y: ${offset.dy}, time: $time');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleButtonWidget(context, pleaseWriteBelow, btnExport, Icons.download_sharp, exportToPDF),
        Container(
          width: double.infinity,
          height: 300,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: tGreen, width: 1),
          ),
          child: LayoutBuilder(
            // Use LayoutBuilder to constrain drawing area
            builder: (context, constraints) {
              return GestureDetector(
                onPanUpdate: (details) {
                  final localPosition = details.localPosition;

                  // Ensure the position stays within the container bounds
                  if (localPosition.dy >= 0 &&
                      localPosition.dy <= constraints.maxHeight &&
                      localPosition.dx >= 0 &&
                      localPosition.dx <= constraints.maxWidth) {
                    setState(() {
                      points.add(localPosition);
                      final time = DateTime.now().millisecondsSinceEpoch;
                      coordinatesLog.add(
                        'x: ${localPosition.dx}, y: ${localPosition.dy}, time: $time',
                      );
                    });
                  }
                },
                onPanEnd: (_) => setState(() => points.add(Offset.zero)),
                onLongPress: () => clearCanvas(),
                child: CustomPaint(
                  painter: SketchPainter(points),
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// appBar: AppBar(
// title: const Text('Drawing Box'),
// actions: [
// IconButton(
// icon: const Icon(Icons.picture_as_pdf),
// onPressed: _exportToPDF,
// ),
// IconButton(
// icon: const Icon(Icons.save),
// onPressed: _exportCoordinates,
// ),
// ],
// ),
