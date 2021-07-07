import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double hasil = 0;
  final textInputController1 = TextEditingController();
  final textInputController2 = TextEditingController();
  String operasi = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Sederhana///"),
        backgroundColor: Color.fromRGBO(0, 200, 0, 100),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.help_outline),
        onPressed: () => Fluttertoast.showToast(
            msg: "Dibuat Oleh : M. Fakhrul Rozi\nNIM: 11850112438\nPAM - A",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromRGBO(0, 200, 0, 100),
            textColor: Colors.white,
            fontSize: 16.0),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                  controller: textInputController1,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: "Angka ke 1",
                    hintText: "Masukkan Angka Ke 1",
                  )),
              TextFormField(
                  controller: textInputController2,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: "Angka Ke 2",
                    hintText: "Masukkan angka ke 2",
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(2),
                  child: Center(
                    child: Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () => Calculate('+'),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        FloatingActionButton(
                            onPressed: () => Calculate('-'),
                            child: Icon(Icons.remove)),
                        SizedBox(
                          width: 50,
                        ),
                        FloatingActionButton(
                          onPressed: () => Calculate('*'),
                          child: Icon(Icons.clear),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        FloatingActionButton(
                          onPressed: () => Calculate('/'),
                          child: Text(
                            "/",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )),
              Text(
                "Hasil dari Operasi  $operasi :",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                "$hasil",
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ),
      ),
    ));
  }

  void Calculate(String operation) {
    final double bilangan1 = double.parse(textInputController1.value.text);
    final double bilangan2 = double.parse(textInputController2.value.text);
    switch (operation) {
      case '+':
        setState(() {
          operasi = "$bilangan1 + $bilangan2";
          hasil = bilangan1 + bilangan2;
        });
        break;
      case '-':
        setState(() {
          operasi = "$bilangan1 - $bilangan2";
          hasil = bilangan1 - bilangan2;
        });
        break;
      case '*':
        setState(() {
          operasi = "$bilangan1 * $bilangan2";
          hasil = bilangan1 * bilangan2;
        });
        break;
      case '/':
        setState(() {
          operasi = "$bilangan1 / $bilangan2";
          hasil = bilangan1 / bilangan2;
        });
        break;
    }
  }
}
