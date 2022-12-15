import 'package:flutter/material.dart';
import 'package:js04/widgets/Convert.dart';
import 'package:js04/widgets/Input.dart';
import 'package:js04/widgets/Result.dart';
import 'package:js04/widgets/Dropdown.dart';
import 'package:js04/widgets/History.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController myController = TextEditingController();
  double celcius = 0;
  double kelvin = 0;
  double reamor = 0;
  double result = 0;
  String newValue = "Kelvin";
  String changeValue = " ";
  var listItem = ["Kelvin", "Farenheit", "Reamur"];
  List<String> listViewItem = <String>[];

  convert() {
    setState(() {
      celcius = double.parse(myController.text);
      if (newValue == "Kelvin")
        result = celcius + 273;
      else
        result = celcius * (4 / 5);
      listViewItem.add(newValue + " : " + result.toString());
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      newValue = changeValue;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("List-Konversi-Suhu-Moch Fajrul Falah"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(children: [
            Input(etInput: myController),
            Dropdown(
                dropdownOnChanged: dropdownOnChanged,
                changeValue: changeValue,
                listItem: listItem,
                newValue: newValue,
                konversiSuhu: convert()),
            Result(result: listViewItem),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: History(historyResult: listViewItem),
            ),
          ]),
        ),
      ),
    );
  }
}
