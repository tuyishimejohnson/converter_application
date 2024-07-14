import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter Application"),
        centerTitle: true,
        backgroundColor: Colors.green[500],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Celsius or Fahrenheit",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0), // Add some space between the text and buttons
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Text("Button 1"),
            ),
            SizedBox(height: 10.0), // Add some space between the buttons
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Text("Button 2"),
            ),
          ],
        ),
      ),
    ),
  ));
}

