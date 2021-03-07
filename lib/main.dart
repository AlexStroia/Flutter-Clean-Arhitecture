import 'package:flutter/material.dart';
import 'package:flutter_clean_arhitecture/feature/movie/presentation/pages/movie_page.dart';
import 'package:flutter_clean_arhitecture/theme.dart';
import 'injection_container.dart' as di;

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
      routes: {"/": (context) => MoviePage()},
      initialRoute: "/",
    );
  }
}
