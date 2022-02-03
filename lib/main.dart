import "package:flutter/material.dart";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Great Places",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Container(),
    );
  }
}
