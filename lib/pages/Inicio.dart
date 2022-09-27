import 'package:flutter/material.dart';
import 'package:flutter_application_cub/pages/perfil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'menu_page.dart';

void main() => runApp(const InicioPage());

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);
  static String id = 'inicio_pages';
  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  void iniciarSesionLogin() async {
    final tokek = await SharedPreferences.getInstance();
    if (tokek.getString('token') != null) {
      Navigator.pushNamed(context, PersonalPage.id);
    } else {
      Navigator.pushNamed(context, Login2Page.id);
    }
  }

  @override
  void initState() {
    super.initState();
    iniciarSesionLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 55, 98, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.transparent,
            child: const SpinKitSpinningLines(
              lineWidth: 7.0,
              color: Color.fromRGBO(121, 0, 1, 1.0),
              size: 150.0,
            ),
          ),
        ],
      ),
    );
  }
}
