import 'package:flutter/services.dart';

class AndroidBackDesktop {
  // Nombre de la comunicación, de vuelta al escritorio del teléfono
  static const String CHANNEL = "android/back/desktop";
  // Establecer el evento de volver al escritorio del teléfono
  static const String eventBackDesktop = "backDesktop";

  // Establecer el método para volver al escritorio del teléfono
  static Future<bool> backToDesktop() async {
    final platform = MethodChannel(CHANNEL);
    // Notificar a Android que regrese al escritorio del teléfono
    try {
      await platform.invokeMethod(eventBackDesktop);
    } on PlatformException catch (e) {
      print(
          "Error de comunicación, error al volver al escritorio del teléfono Android");
      print(e.toString());
    }
    return Future.value(false);
  }
}
