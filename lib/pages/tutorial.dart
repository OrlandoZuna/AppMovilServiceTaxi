import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

const completeColor = Color.fromRGBO(10, 65, 133, 1);
const inProgressColor = Color.fromARGB(249, 150, 3, 3);
const todoColor = Color.fromARGB(255, 170, 171, 175);

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);
  static String id = 'tutorial';

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int _processIndex = 0;
  List<Image> images = [
    Image.asset(
      'images/paso1.png',
      color: const Color.fromARGB(255, 252, 242, 242),
    ),
    Image.asset(
      'images/paso2.png',
      color: const Color.fromARGB(255, 252, 242, 242),
    ),
    Image.asset(
      'images/paso_3.png',
      color: const Color.fromARGB(255, 252, 242, 242),
    ),
    Image.asset(
      'images/paso3_1.png',
      color: const Color.fromARGB(255, 252, 242, 242),
    ),
    Image.asset(
      'images/paso_4.png',
      color: const Color.fromARGB(255, 252, 242, 242),
    ),
  ];

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('GUIA DE INSCRIPCION'),
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
          body: Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Timeline.tileBuilder(
              theme: TimelineThemeData(
                direction: Axis.vertical,
                connectorTheme: const ConnectorThemeData(
                  space: 70.0,
                  thickness: 4.5,
                ),
              ),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemExtentBuilder: (_, __) =>
                    MediaQuery.of(context).size.width / _processes.length,
                oppositeContentsBuilder: (context, index) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      height: 200.0,
                      width: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.all(
                          2.0,
                        ),
                        child: Container(
                          child: images[(index) % 5],
                          decoration: BoxDecoration(
                              color: getColor(index),
                              borderRadius: BorderRadius.circular(12.0)),
                        ),
                      ),
                    ),
                  );
                },
                contentsBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 1.0, left: 5, right: 20),
                    child: Text(
                      _processes[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColor(index),
                      ),
                    ),
                  );
                },
                indicatorBuilder: (_, index) {
                  var color;
                  var child;
                  if (index == _processIndex) {
                    color = inProgressColor;
                    child = const Padding(
                      padding: EdgeInsets.all(7.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 5.0,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  } else if (index < _processIndex) {
                    color = completeColor;
                    child = const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 25.0,
                    );
                  } else {
                    color = todoColor;
                  }

                  if (index <= _processIndex) {
                    return Center(
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: const Size(5.0, 30.0),
                            painter: _BezierPainter(
                              color: color,
                              drawStart: index > 0,
                              drawEnd: index < _processIndex,
                            ),
                          ),
                          DotIndicator(
                            size: 37.0,
                            color: color,
                            child: child,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: const Size(15.0, 15.0),
                            painter: _BezierPainter(
                              color: color,
                              drawEnd: index < _processes.length - 1,
                            ),
                          ),
                          OutlinedDotIndicator(
                            borderWidth: 7.0,
                            color: color,
                          ),
                        ],
                      ),
                    );
                  }
                },
                connectorBuilder: (_, index, type) {
                  if (index > 0) {
                    if (index == _processIndex) {
                      final prevColor = getColor(index - 1);
                      final color = getColor(index);
                      List<Color> gradientColors;
                      if (type == ConnectorType.start) {
                        gradientColors = [
                          Color.lerp(prevColor, color, 0.5)!,
                          color
                        ];
                      } else {
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)!
                        ];
                      }
                      return DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                      );
                    } else {
                      return SolidLineConnector(
                        color: getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: _processes.length,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.navigate_next_sharp,
              size: 55,
            ),
            onPressed: () {
              setState(() {
                _processIndex = (_processIndex + 1) % _processes.length;
              });
            },
            backgroundColor: const Color.fromRGBO(17, 44, 78, 5.0),
          ),
        ),
      ),
    );
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'PASO_1 pongase en un ordenador',
  'PASO_2 llene el formulario con los datos requeridos',
  'PASO_3 verifique los datos y guarde el formulario',
  'PASO_4 Solicita generar carnet de Usuario',
  'PASO_5 imprima o obtenga su carnet de Usuario',
];
