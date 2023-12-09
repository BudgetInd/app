import 'package:flutter/material.dart';
import './constants/text.dart';
import './views/sample/v_sample.dart';
import 'configs/routers.dart';
import 'configs/themes.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Disable Debud banner on right top app
      title: appTitle,
      home: Sample(),
      theme: theme(), //Theme for this App
      initialRoute: Sample.routeName, //Redirect to Splash Screen
      routes: routes, //Setup Routes from routers.dart
    );
  }
}
