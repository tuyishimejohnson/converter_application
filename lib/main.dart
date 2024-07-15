import 'package:flutter/material.dart';
// A program that is used to convert temperature
// specifically Fahrenheit and Celcius.

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
      textAlign: TextAlign.start,
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
      backgroundColor: Colors.green[800],
    );

    Container tempSwitch = Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("Fahrenheit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Radio<bool>(
            groupValue: CelciusOrFahreneit,
            value: false,
            activeColor: Colors.white,
            onChanged: (v) {
              setState(() {
                CelciusOrFahreneit = v!;
              });
            },
          ),
          Text("Celcius",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          ),
          Radio<bool>(
            groupValue: CelciusOrFahreneit,
            value: true,
            activeColor: Colors.white,
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
      margin: EdgeInsets.only(top: 20.0),
      width: 300.0, // Making it square
      height: 50.0, // Making it square
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        child: Text("Convert",
        style: TextStyle(
          fontSize: 19,
          color: Colors.green[800],
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
            color: Colors.grey,
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
