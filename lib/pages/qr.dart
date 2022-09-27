import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/ModelRespuesta.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);
  static String id = 'qr';

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String nombre = '';

  String? model;
  String? nombre_u;

  var usuarioR = TextEditingController();
  var modelCel = TextEditingController();
  var qrText = TextEditingController();

  @override
  void initState() {
    super.initState();
    getMa();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR LECTOR'),
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
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Expanded(flex: 4, child: _buildQrView(context)),
            Expanded(
              flex: 2,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (result != null)
                      Text(
                        'Codigo QR: ${result!.code}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      )
                    else
                      const Text(
                        'Codigo QR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      ),
                    Text(model!),
                    Text(nombre_u!),

                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () async {
                              await controller?.pauseCamera();
                            },
                            child: const Text('pause',
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller?.resumeCamera();
                            },
                            child: const Text('resume',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                          ),
                        )
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
            const Flexible(
              child: SizedBox(
                height: 8.0,
              ),
            ),
            //const CircularProgressIndicator(),
            _userTextField(),
            const SizedBox(
              height: 5.0,
            ),
            _passwordTextField(),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () async {
                        await EnviarDatos();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Text('Enviar');
                        },
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 300 ||
            MediaQuery.of(context).size.height < 300)
        ? 150.0
        : 200.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color.fromARGB(255, 224, 23, 8),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void getMa() async {
    final mod = await SharedPreferences.getInstance();
    final nombre = await SharedPreferences.getInstance();

    setState(() {
      model = mod.getString('dat') ?? 'vacio';
      nombre_u = nombre.getString('nombre_U') ?? 'vacio';
    });
  }

  Future<void> EnviarDatos() async {
    if (usuarioR.text.isNotEmpty && qrText.text.isNotEmpty) {
      String url = "https://jsonplaceholder.typicode.com/posts";
      SharedPreferences sharePreferences =
          await SharedPreferences.getInstance();
      var jsonResponse;
      var response = await http.post(Uri.parse(url),
          body: ({'userId': usuarioR.text, 'id': qrText.text}));
      // obteniendo conexion con api

      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);

        //nombre = jsonResponse['name'];

        print(jsonResponse.toString());

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color.fromRGBO(121, 0, 1, 1.0),
            content: Text(
              '$jsonResponse'.toString(),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )));
      } else {
        //-------------------
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color.fromRGBO(121, 0, 1, 1.0),
            content: Text(
              'datos no correctos o ingrese datos',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )));
      }
    } else {
      //-------------------
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromRGBO(121, 0, 1, 1.0),
          content: Text(
            'datos no correctos o ingrese datos',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )));
    }
  }

  Widget _userTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          keyboardType: TextInputType.text,
          controller: usuarioR,
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@gmail.com',
            labelText: 'correo de usuario',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          controller: qrText,
          keyboardType: TextInputType.text,
          //,, , obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'ingrese su contraseña',
            labelText: 'contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }
}
