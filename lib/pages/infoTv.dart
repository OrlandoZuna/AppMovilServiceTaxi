import 'package:flutter/material.dart';
import 'package:flutter_application_cub/model/TimeLine.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key? key}) : super(key: key);
  static String id = 'infoTv';

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<Color> colors = [
    Colors.red,
    Colors.indigo,
    Colors.green,
    Colors.blueAccent
  ];
  late List<TimeLineCard> timeline;

  @override
  void initState() {
    // TODO: implement initState

    timeline = _getCards();
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
          title: const Text('iNFORMACIONES'),
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
        body: ListView.builder(
          itemCount: timeline.length,
          itemBuilder: (context, index) {
            return Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 2.0,
                      height: 50.0,
                      color: index == 0
                          ? Colors.white
                          : const Color.fromRGBO(17, 44, 78, 1.0),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: colors[(index + 1) % 3],
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(
                        timeline[index].icon,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 2.0,
                      height: 50.0,
                      color: index == timeline.length - 1
                          ? Colors.white
                          : const Color.fromRGBO(17, 44, 78, 1.0),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          timeline[index].title.toUpperCase(),
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
                          timeline[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            );
          },
        ),
      ),
    );
  }

  List<TimeLineCard> _getCards() {
    List<TimeLineCard> timelineCard = [];
    timelineCard.add(TimeLineCard(
        'UATF',
        'La Universidad Autonoma Tomas Frias, es la gran mas estima del estudio en la ciudad de potosi',
        Icons.home));
    timelineCard.add(TimeLineCard(
        'CARRERAS',
        'existen demasia de carreras para que un bachiller pueda estudiar a su preerencia',
        Icons.abc_outlined));
    timelineCard.add(TimeLineCard(
        'CUB',
        'gran encuentro entre universidades y carreras, convivencia de estudiantes, docentes e interesados havgscvgschjdvgcvbchbchbadh',
        Icons.school_outlined));
    timelineCard.add(TimeLineCard(
        'ACTIVIDADES',
        'recreacion de creatividad en la mismas aulas, curso y que haceres a realizarse dentro del mismo',
        Icons.add));
    timelineCard.add(TimeLineCard(
        'PARTICIPACION',
        'superacion al miedo en las diferentes actividades que se realiza en los diferentes encuentros',
        Icons.verified_user));

    return timelineCard;
  }
}
