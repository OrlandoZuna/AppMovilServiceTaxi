import 'package:flutter/material.dart';
import 'package:flutter_application_cub/pages/Inicio.dart';
import 'package:flutter_application_cub/pages/calendario.dart';
import 'package:flutter_application_cub/pages/cards.dart';
import 'package:flutter_application_cub/pages/contactos.dart';
import 'package:flutter_application_cub/pages/infoTv.dart';
import 'package:flutter_application_cub/pages/login.dart';
import 'package:flutter_application_cub/pages/manuDrawer.dart';
import 'package:flutter_application_cub/pages/menu_page.dart';
import 'package:flutter_application_cub/pages/perfil.dart';
import 'package:flutter_application_cub/pages/qr.dart';
import 'package:flutter_application_cub/pages/tutorial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color.fromARGB(255, 136, 13, 13),
      ),
      initialRoute: MenuPage.id,
      routes: {
        CardsPage.id: (context) => CardsPage(),
        Login2Page.id: (context) => Login2Page(),
        MenuPage.id: (context) => const MenuPage(),
        InicioPage.id: (context) => const InicioPage(),
        menu2Page.id: (context) => const menu2Page(),
        PersonalPage.id: (context) => const PersonalPage(),
        CalendariPage.id: (context) => const CalendariPage(),
        InfoPage.id: (context) => InfoPage(),
        TutorialPage.id: (context) => const TutorialPage(),
        ContactosPage.id: (context) => ContactosPage(),
        QrPage.id: (context) => const QrPage(),
      },
      home: const MyHomePage(title: 'Flutter Zuna Huaygua'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  static String id = 'main';

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Hola',
            ),
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
