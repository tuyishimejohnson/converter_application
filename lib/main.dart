import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter Application"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Select Celcius or Fahrenheit"),
      ),
    ),
  ));
}
