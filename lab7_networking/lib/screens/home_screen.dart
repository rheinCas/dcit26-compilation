import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';

import '../models/random_user.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color green = Color(0xFF1F6B45);

  RandomUser? _user; // the user currently shown
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchUser(); // request on initial load, NOT inside build()
  }

  Future<void> _fetchUser() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http
          .get(Uri.parse('https://randomuser.me/api/'))
          .timeout(const Duration(seconds: 15));

      // Check the status BEFORE decoding.
      if (response.statusCode != 200) {
        throw Exception('Server returned status ${response.statusCode}');
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>?;
      if (results == null || results.isEmpty) {
        throw const FormatException('No user data returned');
      }

      final user = RandomUser.fromJson(results.first as Map<String, dynamic>);

      if (!mounted) return; // the screen may be gone by now
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error =
            'Could not load a user. Check your internet connection '
            'and try again.';
        _isLoading = false;
      });
    }
  }

  void _openProfile(RandomUser user) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        // Passes the exact user shown here. No refetch on the Profile screen.
        builder: (context) => ProfileScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User'),
        backgroundColor: green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(24), child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    // 1. Loading state
    if (_isLoading) {
      return const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: green),
          SizedBox(height: 16),
          Text('Loading user...'),
        ],
      );
    }

    // 2. Error state with retry
    if (_error != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wifi_off, size: 56, color: Colors.redAccent),
          const SizedBox(height: 12),
          Text(_error!, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _fetchUser,
            icon: const Icon(Icons.refresh),
            label: const Text('RETRY'),
            style: ElevatedButton.styleFrom(
              backgroundColor: green,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      );
    }

    // 3. Success state
    final user = _user!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => _openProfile(user),
          child: UserAvatar(url: user.pictureUrl, radius: 64),
        ),
        const SizedBox(height: 16),
        Text(
          user.fullName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(user.email, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _fetchUser,
            style: ElevatedButton.styleFrom(
              backgroundColor: green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text('NEW USER'),
          ),
        ),
      ],
    );
  }
}

/// A circular network picture with a loading indicator and an error fallback.
class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.url, required this.radius});

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1F6B45);
    final size = radius * 2;

    final fallback = CircleAvatar(
      radius: radius,
      backgroundColor: const Color(0xFFDDEEE3),
      child: Icon(Icons.person, size: radius, color: green),
    );

    if (url.isEmpty) return fallback;

    return ClipOval(
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        // Loading indicator while the picture downloads
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return SizedBox(
            width: size,
            height: size,
            child: const Center(child: CircularProgressIndicator(color: green)),
          );
        },
        // Fallback if the picture fails to load
        errorBuilder: (context, error, stackTrace) => fallback,
      ),
    );
  }
}
