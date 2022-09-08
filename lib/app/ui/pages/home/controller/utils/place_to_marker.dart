import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../domain/models/place.dart';
import '../../widgets/custom_painters/custom_marker.dart';

Future<BitmapDescriptor> placeToMarker(Place place, int? duration) async {
  print("PLACE MARKER");
  print(place.title);
  print(duration);
  final recoder = ui.PictureRecorder();
  final canvas = ui.Canvas(recoder);
  const size = ui.Size(380, 100);

  final customMarker = MyCustomMarker(
    label: place.title,
    duration: duration,
  );
  customMarker.paint(canvas, size);
  final picture = recoder.endRecording();
  final image = await picture.toImage(
    size.width.toInt(),
    size.height.toInt(),
  );
  final byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );

  final bytes = byteData!.buffer.asUint8List();
  return BitmapDescriptor.fromBytes(bytes);
}
