import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_cub/pages/perfil.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../model/ModelDatos.dart';
import '../model/ModelRespuesta.dart';
import 'menu_page.dart';

class Login2Page extends StatefulWidget {
  static String id = 'login';

  @override
  _Login2PageState createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2Page> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late Image image1;
  String model = "MODELO";
  String conexion = 'conexion';
  String correo = 'admin@gmail.com';
  String contrass = 'admin123';
  bool _isLoading = false;
  String nombre = 'hola';
  List<Respuesta> respuesta = [];

  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  String mac = 'MAC';
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void initState() {
    _isLoading = true;
    image1 = Image.asset("images/ccbolPotosi.jpg");
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    //
    _isLoading = true;
    getModel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1.image, context);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      var connectivityResult = await _connectivity.checkConnectivity();
      result = connectivityResult;
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      obtenerDAtosLogin();
      emailController.text = correo;
      passController.text = contrass;
      if (passController.text != '' &&
          emailController.text != '' &&
          _isLoading == true) {
        login();
      }
    });
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ccbol_2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: image1,
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
                const SizedBox(
                  height: 15.0,
                ),
                _bottonLogin(),
                const SizedBox(
                  height: 5.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  _connectionStatus,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        )));
  }

  void getModel() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    model = androidInfo.model;
    print(androidInfo.model.toString() + '  hola'); // e.g. "Moto G (4)"
  }

  Widget _userTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
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
          controller: passController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
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

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Builder(builder: (context) {
        return RaisedButton(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: const Text(
              'Iniciar Sesion',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Colors.green,
          onPressed: () async {
            await login();
            await saveDatos();
            setState(() {
              emailController.text = '';
              passController.text = '';
            });
          },
        );
      });
    });
  }

  saveDatos() async {
    Mac macc = Mac(mac, model);
    List<String> modell = [];

    modell.add(macc.m);
    modell.add(macc.mo);

    final ma = await SharedPreferences.getInstance();
    final maaaaa = await SharedPreferences.getInstance();
    maaaaa.setString('dats', macc.m);
    final modelll = await SharedPreferences.getInstance();
    modelll.setString('dat', macc.mo);
    ma.setStringList('datos', modell);

    print(macc.mo + macc.m);
  }

  Future<void> login() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      String url = "http://swservice.uatf.edu.bo/api/login";
      SharedPreferences sharePreferences =
          await SharedPreferences.getInstance();
      var jsonResponse;
      var response = await http.post(Uri.parse(url),
          body: ({
            'email': emailController.text,
            'password': passController.text
          }));
      // obteniendo conexion con api

      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        nombre = jsonResponse['name'];
        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });
          print(jsonResponse['name']);
          final nombreUsuario = await SharedPreferences.getInstance();
          nombreUsuario.setString('nombre_U', jsonResponse['name']);
          sharePreferences.setString("token", jsonResponse['token']).toString();
          await saveLogin();
          Navigator.pushNamed(
            context,
            PersonalPage.id,
            arguments: Respuesta(jsonResponse['name'], jsonResponse['token'],
                jsonResponse['expires']),
          );
        }
      } else {
        setState(() {
          _isLoading == false;
        });
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromRGBO(17, 44, 78, 1.0),
          content: Text(
            "ingrese datos en los campos requeridos",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )));
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        //await Future.delayed(Duration(seconds: 3));
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  void obtenerDAtosLogin() async {
    final co = await SharedPreferences.getInstance();
    final con = await SharedPreferences.getInstance();

    correo = co.getString('correo') ?? '';
    contrass = con.getString('contraseña') ?? '';
    print(correo.toString());
    print(contrass.toString());
  }

  saveLogin() async {
    SharedPreferences corr = await SharedPreferences.getInstance();
    SharedPreferences toki = await SharedPreferences.getInstance();
    bool tok = true;
    toki.setBool('toki', tok);
    SharedPreferences contra = await SharedPreferences.getInstance();
    corr.setString('correo', emailController.text);
    contra.setString('contraseña', passController.text);
  }
}
