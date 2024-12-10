import 'package:flutter/material.dart';
import 'package:nuwa/widgets/title_button_widget.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../helpers/pdf_exporter.dart';
import '../helpers/sketch_painter.dart';

class SketchBox extends StatefulWidget {
  const SketchBox({Key? key}) : super(key: key);

  @override
  State<SketchBox> createState() => _SketchBoxState();
}

class _SketchBoxState extends State<SketchBox> {
  final List<Offset> points = [];
  final List<String> coordinatesLog = [];

  void clearCanvas() {
    setState(() {
      points.clear();
      coordinatesLog.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleButtonWidget(context, pleaseWriteBelow, btnExport, Icons.download_sharp,
            () => exportToPDF(context, points)),
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
            builder: (context, constraints) {
              return GestureDetector(
                onPanUpdate: (details) {
                  final localPosition = details.localPosition;
                  if (localPosition.dy >= 0 &&
                      localPosition.dy <= constraints.maxHeight &&
                      localPosition.dx >= 0 &&
                      localPosition.dx <= constraints.maxWidth) {
                    setState(() {
                      points.add(localPosition);
                      final time = DateTime.now().millisecondsSinceEpoch;
                      final logEntry =
                          'x: ${localPosition.dx}, y: ${localPosition.dy}, time: $time';
                      coordinatesLog.add(logEntry);

                      ///---------------------------------attention-------------------------------
                      ///----------------------------------------------------------------

                      // coordinateLog(coordinatesLog); UnComment this function to see log for X and Y dimensions

                      ///----------------------------------------------------------------
                      //////----------------------------------------------------------------
                      ///---------------------------------attention-------------------------------
                    });
                  }
                },
                onPanEnd: (_) => setState(() => points.add(Offset.zero)),
                onLongPress: () => clearCanvas(),
                child: CustomPaint(
                  painter: Painter(points),
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
