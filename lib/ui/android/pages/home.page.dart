import 'package:flutter/material.dart';
import 'package:imc/blocs/imc.bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();

  FocusNode _heightFocus = FocusNode();
  FocusNode _weightFocus = FocusNode();

  void _calculator() {
    setState(() {
      bloc.calculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo de IMC"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Altura (cm)"),
              controller: bloc.heightCtrl,
              focusNode: _heightFocus,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _heightFocus, _weightFocus);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Peso (kg)"),
              controller: bloc.weightCtrl,
              focusNode: _weightFocus,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                _weightFocus.unfocus();
                _calculator();
              },
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
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: FlatButton(
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
                ),
                onPressed: _calculator,
              ),
            ),
          )
        ],
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
