import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_intern/providers/user_provider.dart';
import 'package:suitmedia_test_intern/views/screen1.dart';
import 'package:suitmedia_test_intern/views/screen2.dart';
import 'package:suitmedia_test_intern/views/screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        routes: {
          '/screen2': (context) => const Screen2(),
          '/screen3': (context) => Screen3(),
        },
        title: 'App Suitmedia Intern',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Screen1(),
      ),
    );
  }
}
