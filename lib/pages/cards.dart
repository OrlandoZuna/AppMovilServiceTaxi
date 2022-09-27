import 'package:flutter/material.dart';
import 'package:flutter_application_cub/pages/Inicio.dart';

class CardsPage extends StatefulWidget {
  static String id = 'cards';

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
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
            title: const Text('HOME'),
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
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: <Widget>[
                  //_Card2(),
                  _Card3(),
                  _Card1(),
                  _Card4(),
                  _Card5(),
                  _Card6(),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(21, 39, 70, 1),
            onPressed: () {
              Navigator.pushNamed(context, InicioPage.id);
            },
            child: const Icon(
              Icons.login_rounded,
              size: 35.0,
            ),
          ),
        ));
  }

  Widget _Card1() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const <Widget>[
            Text('BIENVENIDOS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Color.fromRGBO(109, 0, 0, 5),
                )),
            SizedBox(height: 10.0),
            Text(
              'Animate a ser participe en todas las actividades y cursos existentes y programados, no vengas envano, llevate una lluvia de ideas y dudas que puedas resolverlo en, al retornar a CASA.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 10, 9, 78),
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Card2() {
    return Card(
      elevation: 5.0,
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const <Widget>[
            Text('soy un card',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )),
            SizedBox(height: 10.0),
            Text(
                'chdbchsdhcgsdgvcgsdvjbsdhvbsdchjd cdsvucgsdcgyusdgcuyds hdhcygsdyuhciysdcsdpyudsgsdlcgdshcysdishvhfuvhushvufhisvnjsvhisdvsidbvihsd')
          ],
        ),
      ),
    );
  }

  Widget _Card3() {
    DateTime dateTime = DateTime.now();
    print(dateTime.day);
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('POTOSI'),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: FadeInImage(
                  placeholder: AssetImage('images/loading.gif'),
                  image: AssetImage('images/ccbol_0.jpg')),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('aqui estara la fecha de hoy'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Card4() {
    DateTime dateTime = DateTime.now();
    print(dateTime.day);
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('POTOSI'),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FadeInImage(
                  placeholder: AssetImage('images/loading.gif'),
                  image: AssetImage('images/ccbol_1.jpg')),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('aqui estara la fecha de hoy'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Card5() {
    DateTime dateTime = DateTime.now();
    print(dateTime.day);
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('POTOSI'),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: FadeInImage(
                  placeholder: AssetImage('images/loading.gif'),
                  image: AssetImage('images/ccbol_2.jpg')),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('aqui estara la fecha de hoy'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Card6() {
    DateTime dateTime = DateTime.now();
    print(dateTime.day);
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('POTOSI'),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.elliptical(50.0, 10.0)),
              child: FadeInImage(
                  placeholder: AssetImage('images/loading.gif'),
                  image: AssetImage('images/ccbol_3.jpg')),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('aqui estara la fecha de hoy'),
            ),
          ],
        ),
      ),
    );
  }
}
