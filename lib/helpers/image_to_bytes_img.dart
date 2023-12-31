
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/services.dart';

Future<Uint8List> imageToBytes(String path, {int width= 130}) async{
  final byteData = await rootBundle.load(path);
  final bytes = byteData.buffer.asUint8List();
  final codec = await ui.instantiateImageCodec(
    bytes,
    targetWidth: width,
  );
  final frame = await codec.getNextFrame();
  final newByteData = await frame.image.toByteData(
    format: ui.ImageByteFormat.png,

  );
  return newByteData!.buffer.asUint8List();
}