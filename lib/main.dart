import 'package:flutter/material.dart';

void main() => runApp(TemperatureConverter());

class TemperatureConverter extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
      ),
      home: TemperatureApp(),
    );
  }
}

class TemperatureApp extends StatefulWidget {
  @override
  TempState createState() => TempState();
}

class TempState extends State<TemperatureApp> {
  double input = 0.0;
  double output = 0.0;
  bool CelciusOrFahreneit = true;

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (str) {
        try {
          input = double.parse(str);
        } catch (e) {
          input = 0.0;
        }
      },
      decoration: InputDecoration(
        labelText:
        "${CelciusOrFahreneit == false ? "Fahrenheit" : "Celsius"}",
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
      ),
    );

    AppBar appBar = AppBar(
      title: Text("Temperature Converter",
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 24,
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green[500],
    );

    Container tempSwitch = Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("F"),
          Radio<bool>(
            groupValue: CelciusOrFahreneit,
            value: false,
            onChanged: (v) {
              setState(() {
                CelciusOrFahreneit = v!;
              });
            },
          ),
          Text("C"),
          Radio<bool>(
            groupValue: CelciusOrFahreneit,
            value: true,
            onChanged: (v) {
              setState(() {
                CelciusOrFahreneit = v!;
              });
            },
          ),
        ],
      ),
    );

    Container calcBtn = Container(
      child: ElevatedButton(
        child: Text("Convert",
        style: TextStyle(
          fontSize: 19,
        ),
        ),
        onPressed: () {
          setState(() {
            CelciusOrFahreneit == false
                ? output = (input - 32) * (5 / 9)
                : output = (input * 9 / 5) + 32;
          });
          AlertDialog dialog = AlertDialog(
            content: CelciusOrFahreneit == false
                ? Text(
                "${input.toStringAsFixed(2)} F : ${output.toStringAsFixed(2)} C")
                : Text(
                "${input.toStringAsFixed(2)} C : ${output.toStringAsFixed(2)} F"),
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog;
            },
          );
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            color: Colors.brown,
            padding: EdgeInsets.all(16.0),
            child: orientation == Orientation.portrait
                ? Column(
              children: <Widget>[
                inputField,
                tempSwitch,
                calcBtn,
              ],
            )
                : Row(
              children: <Widget>[
                Expanded(child: inputField),
                Expanded(child: tempSwitch),
                Expanded(child: calcBtn),
              ],
            ),
          );
        },
      ),
    );
  }
}
