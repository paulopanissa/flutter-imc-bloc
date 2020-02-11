import 'package:flutter/cupertino.dart';
import 'package:imc/blocs/imc.bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cálculo de IMC"),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: "Altura (cm)",
              controller: bloc.heightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: "Peso (kg)",
              controller: bloc.weightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              bloc.result,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: CupertinoButton.filled(
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    bloc.calculate();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
