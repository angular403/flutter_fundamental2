import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Latihan(),
    );
  }
}

class Latihan extends StatelessWidget {
  const Latihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Elevated Button'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Button 1 '),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  minimumSize: Size(200, 40),
                  shape: StadiumBorder(),
                  elevation: 2,
                  shadowColor: Colors.green,
                  onSurface: Colors.red,
                  side: BorderSide(width: 2, color: Colors.red.shade900)),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
              label: Text('Button 2'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.yellow),
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>
                      states.any((element) => element == MaterialState.pressed)
                          ? Colors.purple
                          : Colors.red), 
                          overlayColor: MaterialStateProperty.all(Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}
