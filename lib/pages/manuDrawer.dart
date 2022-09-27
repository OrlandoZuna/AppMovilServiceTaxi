import 'package:flutter/material.dart';
import 'package:flutter_application_cub/pages/menu_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/ModelRespuesta.dart';
import 'login.dart';

class menu2Page extends StatefulWidget {
  static String id = 'manuDrawer';
  const menu2Page({Key? key}) : super(key: key);

  @override
  _menu2PageState createState() => _menu2PageState();
}

class _menu2PageState extends State<menu2Page> {
  String? model;
  String? mac;
  String? nombre_u;

  @override
  void initState() {
    getMa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Respuesta? arguments =
        ModalRoute.of(context)?.settings.arguments as Respuesta?;
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero, // esto es de la imagen
        children: [
          SizedBox(
            height: 200.0,
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('images/menuapp.png'),
                  fit: BoxFit.fill,
                  //alignment: Alignment.topLeft,
                ),
                /*borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),*/
              ),
              currentAccountPicture:
                  Image.asset('images/usuario.png', width: 70.0, height: 70.0),
              arrowColor: Colors.red,

              /* currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset('images/usuarioimagen.png',
                    fit: BoxFit.cover,),
                  ),
                ),*/
              accountName: null,
              accountEmail: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(top: 0.0),
                margin: const EdgeInsets.only(top: 0.0, bottom: 00.0),
                child: Text(nombre_u!.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Color.fromRGBO(17, 44, 78, 5.0),
                    )),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 0.0, left: 20.0),
            height: 50.0,
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Admin@uatf.edu.bo",
                        style: TextStyle(
                          color: Color.fromRGBO(17, 44, 78, 5.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text('Modelo: ' + model!.toUpperCase(),
                        style: const TextStyle(
                          color: Color.fromRGBO(17, 44, 78, 5.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        )),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(
                color: Color.fromRGBO(17, 44, 78, 5.0),
              ),
            ),
            leading: const Icon(Icons.home,
                color: Color.fromRGBO(17, 44, 78, 5.0), size: 30.0),
            onTap: () {
              Navigator.of(context).pop();
              //Navigator.pushNamed(context, MyHomePage.id);
            },
          ),
          ListTile(
            title: const Text(
              'Cuaderno Virtual',
              style: TextStyle(
                color: Color.fromRGBO(17, 44, 78, 1.0),
              ),
            ),
            leading: const Icon(Icons.import_contacts,
                color: Color.fromRGBO(17, 44, 78, 5.0), size: 30.0),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.pushNamed(context, CuadernoPage.id);
            },
          ),
          ListTile(
            title: const Text('Registrar Asistencia',
                style: TextStyle(color: Color.fromRGBO(17, 44, 78, 1.0))),
            leading: const Icon(Icons.app_registration_rounded,
                color: Color.fromRGBO(17, 44, 78, 5.0), size: 30.0),
            onTap: () {
              Navigator.of(context).pop();
              //Navigator.pushNamed(context, VerRegistroPage.id);
            },
          ),
          ListTile(
            title: const Text('Ver Asistencias',
                style: TextStyle(color: Color.fromRGBO(17, 44, 78, 1.0))),
            leading: const Icon(Icons.assignment_sharp,
                color: Color.fromRGBO(17, 44, 78, 5), size: 30.0),
            onTap: () {
              Navigator.of(context).pop();
              //Navigator.pushNamed(context, VerRegistroPage.id);
              removeDAtosLogin();
            },
          ),
          ListTile(
            title: const Text('ImportExport',
                style: TextStyle(color: Color.fromRGBO(17, 44, 78, 1.0))),
            leading: const Icon(Icons.import_export,
                color: Color.fromRGBO(17, 44, 78, 5.0), size: 30.0),
            onTap: () {
              Navigator.of(context).pop();
              //Navigator.pushNamed(context, ImporExpor.id);
            },
          ),
          ListTile(
            iconColor: Colors.black54,
            title: const Text('Salir',
                style: TextStyle(color: Color.fromRGBO(17, 44, 78, 1.0))),
            leading: const Icon(Icons.exit_to_app,
                color: Color.fromRGBO(17, 44, 78, 5.0), size: 30.0),
            onTap: () {
              showDialog(
                context: context,
                barrierColor: Colors.transparent,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color.fromRGBO(121, 0, 1, 20.0),
                  buttonPadding: const EdgeInsets.all(20.0),
                  title: const Text(
                    'Cerrar Sesion',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  content: const Text(
                    'Esta seguro de salir',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    FlatButton(
                        child: const Text(
                          'Si',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromRGBO(17, 0, 78, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop();
                            removeDAtosLogin();
                            Navigator.pushNamed(context, MenuPage.id);
                          });
                        }),
                    FlatButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color.fromRGBO(17, 0, 78, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void getMa() async {
    final ma = await SharedPreferences.getInstance();
    final mod = await SharedPreferences.getInstance();
    final nombre = await SharedPreferences.getInstance();

    setState(() {
      mac = ma.getString('dats') ?? 'vacio';
      model = mod.getString('dat') ?? 'vacio';
      nombre_u = nombre.getString('nombre_U') ?? 'vacio';
    });
  }

  void removeDAtosLogin() async {
    final co = await SharedPreferences.getInstance();
    final con = await SharedPreferences.getInstance();
    final toki = await SharedPreferences.getInstance();
    setState(() {
      co.remove('correo');
      con.remove('contraseña');
      toki.remove('token');
    });
    print('se eliminaron correo y contraseña');
  }
}
