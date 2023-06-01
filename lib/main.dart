import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_management/HomePage.dart';

void main() {
  runApp(ProviderScope(child: const Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
home: HomePage(),
theme: ThemeData(primarySwatch: Colors.primaries[3]),
    );
  }
}
