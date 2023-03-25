import 'package:flutter/material.dart';
import 'package:sw_planner/features/tasks_page/pages/tasks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SW Planner',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF0D47A1,
          <int, Color>{
            50: Color.fromRGBO(13, 71, 161, 1),
            100: Color.fromRGBO(13, 71, 161, 1),
            200: Color.fromRGBO(13, 71, 161, 1),
            300: Color.fromRGBO(13, 71, 161, 1),
            400: Color.fromRGBO(13, 71, 161, 1),
            500: Color.fromRGBO(13, 71, 161, 1),
            600: Color.fromRGBO(13, 71, 161, 1),
            700: Color.fromRGBO(13, 71, 161, 1),
            800: Color.fromRGBO(13, 71, 161, 1),
            900: Color.fromRGBO(13, 71, 161, 1),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pl', 'PL'),
      ],
      home: const TasksPage(),
    );
  }
}

// class RootPage extends StatelessWidget {
//   const RootPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
