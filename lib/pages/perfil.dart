import 'package:flutter/material.dart';
import 'package:flutter_application_cub/pages/qr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../model/ModelDatos.dart';
import '../model/back_destop.dart';
import 'manuDrawer.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);
  static String id = 'perfil';

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  late final Mac maa = getdatoss();
  String mac = 'mac';
  String modelo = 'modelo';
  String nombre_u = 'Admin';

  @override
  void initState() {
    super.initState();
    getMa();
    getlist();
  }

  @override
  Widget build(BuildContext context) {
    //final Respuesta? arguments = ModalRoute.of(context)?.settings.arguments as Respuesta?;
    return WillPopScope(
        onWillPop: (AndroidBackDesktop.backToDesktop),
        child: Scaffold(
          //backgroundColor: const Color(0x5A2F5765),
          backgroundColor: Colors.white,
          drawer: const menu2Page(),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(350.0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 0, top: 50.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/uatf2.png'),
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    colorFilter: ColorFilter.mode(
                        Colors.transparent, BlendMode.colorBurn),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 160.0, left: 20, bottom: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 0.0),
                      Image.asset(
                        'images/usuario.png',
                        width: 100,
                        height: 100,
                        alignment: Alignment.bottomCenter,
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        nombre_u.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(17, 44, 78, 5.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //actions: const [Icon(Icons.search, size: 25.0),],
              primary: true,
            ),
          ),

          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/uatf0.png'),
              fit: BoxFit.cover,
            )),
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return ListView(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 0, right: 0, bottom: 20.0),
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 1.0),
                            uatt2(),
                            const SizedBox(
                              width: 6.0,
                            ),
                            uatf3(),
                            const SizedBox(width: 6.0),
                            uatf1(),
                            const SizedBox(width: 6.0),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 1.0),
                            uatf4(),
                            const SizedBox(
                              width: 6.0,
                            ),
                            uatf5(),
                            const SizedBox(width: 6.0),
                            uatf6(),
                            const SizedBox(width: 6.0),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 30.0,
                      ),
                      //_datosCel(),
                      Text(
                        'Modelo: ' + modelo.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 15.0,
                          color: Color.fromRGBO(17, 44, 78, 5.0),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                    ],
                  );
                }),
          ),
        ));
  }

  void getMa() async {
    final ma = await SharedPreferences.getInstance();
    final mod = await SharedPreferences.getInstance();
    final nombre = await SharedPreferences.getInstance();

    setState(() {
      mac = ma.getString('dats') ?? 'vacio';
      modelo = mod.getString('dat') ?? 'vacio';
      nombre_u = nombre.getString('nombre_U') ?? 'vacio';
    });
  }

  void getlist() async {
    final myList = await SharedPreferences.getInstance();
    //final mod = await SharedPreferences.getInstance();

    var list = myList.getStringList('myList') ?? 'vacio';
    print(list);
  }

  Container uatf1() {
    return Container(
      color: const Color.fromRGBO(17, 44, 78, 5.0),
      width: 90.0,
      height: 90.0,
      child: Column(
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, QrPage.id),
            icon: const Icon(Icons.assignment_sharp,
                color: Colors.white, size: 60),
            padding: const EdgeInsets.only(top: 5.0, right: 35.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Ver_Asis.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container uatt2() {
    return Container(
      color: const Color.fromRGBO(17, 44, 78, 5.0),
      width: 90.0,
      height: 90.0,
      child: Column(
        children: [
          IconButton(
            onPressed: () =>
                {}, // Navigator.pushNamed(context, CuadernoPage.id),
            icon: const Icon(Icons.import_contacts,
                color: Colors.white, size: 60),
            padding: const EdgeInsets.only(top: 5.0, right: 35.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Lista U.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container uatf3() {
    return Container(
      color: const Color.fromRGBO(17, 44, 78, 5.0),
      width: 90.0,
      height: 90.0,
      child: Column(
        children: [
          IconButton(
            onPressed: () =>
                {}, // Navigator.pushNamed(context, VerRegistroPage.id),
            icon: const Icon(Icons.app_registration,
                color: Colors.white, size: 60),
            padding: const EdgeInsets.only(top: 5.0, right: 35.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Registrar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container uatf4() {
    return Container(
      color: const Color.fromRGBO(17, 44, 78, 5.0),
      width: 90.0,
      height: 90.0,
      child: Column(
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, MyHomePage.id),
            icon: const Icon(Icons.perm_device_info_rounded,
                color: Colors.white, size: 60),
            padding: const EdgeInsets.only(top: 5.0, right: 35.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Movil',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container uatf5() {
    return Container(
      color: const Color.fromRGBO(17, 44, 78, 5.0),
      width: 90.0,
      height: 90.0,
      child: Column(
        children: [
          IconButton(
            onPressed: () => {}, // Navigator.pushNamed(context, ImporExpor.id),
            icon:
                const Icon(Icons.import_export, color: Colors.white, size: 60),
            padding: const EdgeInsets.only(top: 5.0, right: 35.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Im_Exp.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container uatf6() {
    return Container(
      color: const Color.fromRGBO(17, 44, 78, 5.0),
      width: 90.0,
      height: 90.0,
      child: Column(
        children: [
          IconButton(
            onPressed: () => launch("https://www.uatf.edu.bo/"),
            icon: const Icon(Icons.attachment_rounded,
                color: Colors.white, size: 60),
            padding: const EdgeInsets.only(top: 5.0, right: 35.0),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'U.A.T.F.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container _datosCel() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.all(25.0),
        child: Image.asset(
          'images/movil.png',
          height: 270.0,
          color: Colors.blueGrey,
        ));
  }

  Mac getdatoss() {
    maa.mo = modelo;
    maa.m = mac;
    return maa;
  }
}
