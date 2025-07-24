import 'package:crud_bloc_api_test/presentation/screen/home_crud.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeCrud(),
    );
  }
}

// kjkkj
// Test3
// Test4
// Test5
// Test6
// Test7

// Test8
// Test9