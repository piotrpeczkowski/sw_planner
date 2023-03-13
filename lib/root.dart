import 'package:flutter/material.dart';
import 'package:sw_planner/tasks.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SW Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
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
