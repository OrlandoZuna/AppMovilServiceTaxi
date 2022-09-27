import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_cub/pages/calendario.dart';
import 'package:flutter_application_cub/pages/cards.dart';
import 'package:flutter_application_cub/pages/contactos.dart';
import 'package:flutter_application_cub/pages/infoTv.dart';
import 'package:flutter_application_cub/pages/tutorial.dart';

import '../model/back_destop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  static String id = 'menu_page';

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final NavigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screens = [
    const CalendariPage(),
    InfoPage(),
    CardsPage(),
    TutorialPage(),
    ContactosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final itemss = <Widget>[
      const Icon(Icons.calendar_month, size: 27, color: Colors.white),
      const Icon(Icons.info_outline, size: 27, color: Colors.white),
      const Icon(Icons.home, size: 27, color: Colors.white),
      const Icon(Icons.book_online, size: 27, color: Colors.white),
      const Icon(Icons.contact_phone, size: 27, color: Colors.white),
    ];

    return WillPopScope(
        onWillPop: (AndroidBackDesktop.backToDesktop),
        child: Container(
          color: const Color.fromRGBO(121, 0, 1, 1.0),
          child: SafeArea(
            top: false,
            child: Scaffold(
              //extendBody: true,
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: screens[index],
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(color: Colors.black),
                ),
                child: CurvedNavigationBar(
                  key: NavigationKey,
                  color: const Color.fromRGBO(121, 0, 1, 1.0),
                  backgroundColor: Colors.transparent,
                  height: 70.0,
                  animationCurve: Curves.easeInOutCubic,
                  animationDuration: const Duration(milliseconds: 300),
                  index: index,
                  items: itemss,
                  onTap: (index) => setState(() {
                    this.index = index;
                    if (index == 1) {
                      print('estas en el index 1');
                      visibleForTesting;
                    }
                  }),
                ),
              ),
              floatingActionButton: Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color.fromRGBO(21, 39, 70, 1),
                    onPressed: () {},
                    child: const Icon(
                      Icons.login_rounded,
                      size: 35.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
