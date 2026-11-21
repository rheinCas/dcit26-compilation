import 'package:material_ui/material_ui.dart';

import '../models/random_user.dart';
import 'home_screen.dart' show UserAvatar;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  /// The exact user that was showing on the Home screen.
  final RandomUser user;

  static const Color green = Color(0xFF1F6B45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            UserAvatar(url: user.pictureUrl, radius: 56),
            const SizedBox(height: 12),
            Text(
              user.fullName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _Section(
              title: 'Personal',
              rows: [
                _Row('Gender', user.gender),
                _Row('Date of birth', user.dob),
                _Row('Age', user.age),
                _Row('Nationality', user.nationality),
              ],
            ),
            _Section(
              title: 'Contact',
              rows: [
                _Row('Email', user.email),
                _Row('Phone', user.phone),
                _Row('Cell', user.cell),
              ],
            ),
            _Section(
              title: 'Location',
              rows: [
                _Row('Street', user.street),
                _Row('City', user.city),
                _Row('State', user.state),
                _Row('Country', user.country),
                _Row('Postcode', user.postcode),
                _Row('Timezone', user.timezone),
              ],
            ),
            _Section(
              title: 'Account',
              rows: [
                _Row('Username', user.username),
                _Row('UUID', user.uuid),
                _Row('Registered', user.registered),
              ],
            ),
            _Section(
              title: 'ID',
              rows: [
                _Row('ID name', user.idName),
                _Row('ID value', user.idValue),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('BACK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row {
  const _Row(this.label, this.value);

  final String label;
  final String value;
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.rows});

  final String title;
  final List<_Row> rows;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F6B45),
              ),
            ),
            const Divider(),
            for (final row in rows)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        row.label,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: SelectableText(row.value)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
