// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_application_cub/model/evento.dart';
import 'package:timelines/timelines.dart';

class CalendariPage extends StatefulWidget {
  const CalendariPage({Key? key}) : super(key: key);
  static String id = 'calendario';

  @override
  State<CalendariPage> createState() => _CalendariPageState();
}

class _CalendariPageState extends State<CalendariPage> {
  final timelines = Timeline();
  late List<Evento> evento;

  @override
  void initState() {
    evento = _evento();
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
          title: const Text('EVENTOS'),
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
          clipBehavior: Clip.hardEdge,
          builder: TimelineTileBuilder.fromStyle(
            contentsAlign: ContentsAlign.alternating,
            connectorStyle: ConnectorStyle.dashedLine,
            endConnectorStyle: ConnectorStyle.transparent,
            contentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                    borderOnForeground: false,
                    color: const Color.fromARGB(255, 138, 4, 4),
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Color.fromARGB(255, 247, 240, 240),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color.fromARGB(255, 63, 2, 2),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              evento[index].lugar,
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
                              evento[index].descripcion_e,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              evento[index].fecha_e.toString().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))),
            itemCount: evento.length,
          ),
        ),
      ),
    );
  }

  List<Evento> _evento() {
    List<Evento> eventos = [];
    eventos.add(Evento(
        DateTime.now(),
        'La Universidad Autonoma Tomas Frias, brinda concurso de programacion',
        'UNIVERSIDAD AUTONOMA TOMAS FRIAS'));
    eventos.add(Evento(
        DateTime.now(),
        'La Universidad Autonoma Tomas Frias, brinda concurso de programacion',
        'UNIVERSIDAD AUTONOMA TOMAS FRIAS'));
    eventos.add(Evento(
        DateTime.now(),
        'La Universidad Autonoma Tomas Frias, brinda concurso de programacion',
        'UNIVERSIDAD AUTONOMA TOMAS FRIAS'));
    eventos.add(Evento(
        DateTime.now(),
        'La Universidad Autonoma Tomas Frias, brinda concurso de programacion',
        'UNIVERSIDAD AUTONOMA TOMAS FRIAS'));
    eventos.add(Evento(DateTime.now(), 'concursos de programacion',
        'UNIVERSIDAD AUTONOMA TOMAS FRIAS'));
    return eventos;
  }
}
