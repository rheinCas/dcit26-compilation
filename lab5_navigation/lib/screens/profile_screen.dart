import 'package:material_ui/material_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color green = Color(0xFF1F6B45);

  @override
  Widget build(BuildContext context) {
    // No drawer here, so AppBar shows an automatic back arrow
    // that also calls Navigator.pop().
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xFFDDEEE3),
                child: Icon(Icons.person, size: 48, color: green),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Profile screen',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context), // back to Home
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('GO HOME'),
            ),
          ],
        ),
      ),
    );
  }
}