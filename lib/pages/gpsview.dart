import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_cub/pages/gpsview_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class gpsview extends StatelessWidget {

  //const gpsview({Key? key}) : super(key: key);

  static String id = 'gpsview';

  @override
  //_gpsviewState createState() => _gpsviewState();
//}

//class _gpsviewState extends State<gpsview> {
  //final _controller = GpsviewController();
  final Completer<GoogleMapController> _controllerrs =
  Completer<GoogleMapController>();


  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-19.564539, -65.761532),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GpsviewController>(
      create: (_){
        final controller = GpsviewController();
        controller.onMarketTap.listen((String id) {
          print("goo to $id");
        });
        return controller;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('MAPS'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromRGBO(74, 0, 2, 5),
                  Color.fromRGBO(109, 0, 0, 5),
                  Color.fromRGBO(222, 15, 14, 5),
                ],
              ),
            ),
          ),
        ),
        body: Consumer<GpsviewController>(
          builder: (_, controller, __) => GoogleMap(
            //mapType: MapType.hybrid,
            markers: controller.markers,
            initialCameraPosition: controller.initialCameraPosition,
            myLocationButtonEnabled: false,
            compassEnabled: false,
            onTap: controller.onTap,
            onMapCreated: controller.onMapCreated,
            //onMapCreated: (GoogleMapController controller) {
            // _controller.complete(controller);
            //},
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text(''),
          icon: const Icon(Icons.directions_boat),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controllerrs.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}