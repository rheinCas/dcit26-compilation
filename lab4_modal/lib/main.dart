import 'package:material_ui/material_ui.dart';

import 'widgets/sample_modal.dart';

void main() => runApp(const MyApp());

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Modal'),
        backgroundColor: const Color(0xFF1F6B45),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) => const SampleModal(),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1F6B45),
            foregroundColor: Colors.white,
          ),
          child: const Text('OPEN MODAL'),
        ),
      ),
    );
  }
}
