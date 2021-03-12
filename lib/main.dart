import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoa", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  int _vagas = 20;
  int _total = 0;
  String _infoText = "Restaurante vazio!";

  void _changePeople(int delta) {
    setState(() {
      if (delta > 0) {
        
        if (_people < 20) {
          _people += delta;
          _total++;
        }
      } else {
        if (_people > 0) {
          _people += delta;
        }
      }

      if (_people == 0) {
        _infoText = "Restaurante vazio!";
      } else if (_people == 20) {
        _infoText = "Restaurante lotado!";
      } else {
        _infoText = "HÁ VAGAS!";
      }
    });

    _vagas = 20 - _people;
  }

  void _zerar(){
    setState(() {
      _people=0;
      _vagas = 20;
      _total=0;
      _infoText = "Restaurante vazio!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/mesas.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    child: Text(
                      "-1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0,
                    decoration: TextDecoration.none)),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 100, 0.0, 0.0),
              child: Text("LOTAÇÃO MÁXIMA: 20",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      decoration: TextDecoration.none)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Text("LUGARES VAZIOS: $_vagas",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      decoration: TextDecoration.none)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.people,
                  size: 50,
                  color: Colors.white,
                ),
                Text("ROTAÇÃO DIÁRIA: $_total",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    decoration: TextDecoration.none)),
                
              ],
            ),
            Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    child: Text(
                      "ZERAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _zerar();
                    },
                  ),
                ),
          ],
        ),
      ],
    );
  }
}
