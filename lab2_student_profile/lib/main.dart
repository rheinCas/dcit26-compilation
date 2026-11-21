import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color green = Color(0xFF1F6B45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        backgroundColor: green,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(
              name: 'Rheinheart Casabal',
              course: 'BSCS / 3rd Year / Section 1',
            ),
            SizedBox(height: 20),
            ProfileField(label: 'Name', value: 'Rheinheart Casabal'),
            ProfileField(label: 'Age', value: '20'),
            ProfileField(
              label: 'Course/Year/Section',
              value: 'BSCS / 3rd Year / Section 1',
            ),
            ProfileField(
              label: 'About me',
              value: 'I am a 3rd Year Computer Science student from Silang, Cavite. I aspire to be a pilot someday.',
            ),
            ProfileField(
              label: 'Achievements',
              value: "• Dean's Lister\n• YES-O President 2022-2023\n• Supreme Student Council President 2023-2024\n• Supreme Leader BSP-Lumil 2022-2024",
            ),
            ProfileField(
              label: 'Skills',
              value: '• Communication\n• Adaptability\n• SQL\n• Critical Thinking\n• Leadership\n• Teamwork\n• Problem Solving',
            ),
          ],
        ),
      ),
    );
  }
}

/// The light-green box at the top with the avatar, name and course.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.name, required this.course});

  final String name;
  final String course;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFDDEEE3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 32, child: Icon(Icons.person, size: 32)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(course),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// One label + value pair, reused for all six fields.
class ProfileField extends StatelessWidget {
  const ProfileField({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F6B45),
            ),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
