import 'package:flutter/material.dart';
import 'package:flutter_clean_arhitecture/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture ',
      theme: appTheme,
      routes: {"/": (context) => Center()},
      initialRoute: "/",
    );
  }
}
