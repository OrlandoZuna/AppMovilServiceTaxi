import 'dart:async';

import 'package:flutter/material.dart' show ChangeNotifier, ImageConfiguration, Offset;
import 'package:flutter_application_cub/helpers/image_to_bytes_img.dart';
import 'package:flutter_application_cub/pages/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GpsviewController extends ChangeNotifier{

  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();
  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarketTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(-19.571003, -65.755791),
    zoom: 15,
  );

  final _homeIcon = Completer<BitmapDescriptor>();

  GpsviewController(){
    imageToBytes('images/uber.png', width: 150).then((value){
      final bitmap = BitmapDescriptor.fromBytes(value);
      _homeIcon.complete(bitmap);
    },
    );
  }

  void onMapCreated(GoogleMapController controller){
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position)async {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    final icon = await _homeIcon.future;
    final marker = Marker(
      markerId: markerId,
      position: position,
      draggable: true,
      //anchor: const Offset(0.5, 1),
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),}
      icon: icon,
      onTap: (){
        _markersController.sink.add(id);
      },
      onDragEnd: (newPosition){
        print("new position $newPosition");
    },
      
    );
    _markers[markerId] = marker;
    notifyListeners();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _markersController.close();
    super.dispose();
  }
}