import 'package:flutter/material.dart';
import 'package:flutter_application_cub/model/contacto.dart';
import 'package:timelines/timelines.dart';

class ContactosPage extends StatefulWidget {
  ContactosPage({Key? key}) : super(key: key);
  static String id = 'contactos';

  @override
  State<ContactosPage> createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  late List<Contacto> contacto;

  @override
  void initState() {
    super.initState();
    contacto = _getContactos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/fondo.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('CONTACTOS'),
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
          body: Timeline.tileBuilder(
            builder: TimelineTileBuilder.connectedFromStyle(
              contentsAlign: ContentsAlign.basic,
              oppositeContentsBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromARGB(255, 247, 240, 240),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 63, 2, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        contacto[index].nombre.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        contacto[index].area,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        contacto[index].celular.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              contentsBuilder: (context, index) => Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Card(
                  color: const Color.fromARGB(255, 247, 240, 240),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2.0,
                                color: Color.fromARGB(255, 211, 19, 19),
                              )
                            ]),
                        padding: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                        child: Center(child: contacto[index].imagen)),
                  ),
                ),
              ),
              connectorStyleBuilder: (context, index) =>
                  ConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
              itemCount: contacto.length,
            ),
          )),
    );
  }

  //get indicator => null;
  List<Contacto> _getContactos() {
    List<Contacto> contactos = [];
    contactos.add(Contacto('Orlando Zuna Huaygua', 'Desarrollo', 67923312,
        Image.network('https://cdn-icons-png.flaticon.com/512/30/30582.png')));
    contactos.add(Contacto('Mirtha Zuna Huaygua', 'Contabilidad', 78717411,
        Image.network('https://cdn-icons-png.flaticon.com/512/30/30582.png')));
    contactos.add(Contacto('Graciela Zuna Huaygua', 'Secretariado', 68426772,
        Image.network('https://cdn-icons-png.flaticon.com/512/30/30582.png')));
    contactos.add(Contacto('Jhimy E. Zuna Huaygua', 'Arquitectura', 73871763,
        Image.network('https://cdn-icons-png.flaticon.com/512/30/30582.png')));
    contactos.add(Contacto('Herminio Zuna Ramos', 'Agronomia', 67920433,
        Image.network('https://cdn-icons-png.flaticon.com/512/30/30582.png')));
    contactos.add(Contacto('Justina Huaygua R.', 'Agronomia', 75727204,
        Image.asset('images/paso1.png')));

    return contactos;
  }
}
