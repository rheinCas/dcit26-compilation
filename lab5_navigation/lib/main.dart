import 'package:material_ui/material_ui.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Navigation design: ONE root Navigator (the one inside MaterialApp).
/// Home is the first route. Profile and About are separate routes that are
/// pushed on top of Home with MaterialPageRoute. No nested Navigator.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F6B45)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}