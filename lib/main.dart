import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/bloc/bloc.dart';
import 'package:flutter_clean_arhitecture/theme.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
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
