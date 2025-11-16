// File: settings_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    if (user != null) _emailController.text = user!.email ?? '';
  }

  Future<void> _updateEmail() async {
    if (!_formKey.currentState!.validate()) return;
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      await user!.updateEmail(_emailController.text.trim());
      await user!.reload();
      user = FirebaseAuth.instance.currentUser;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email updated successfully')),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update email: ${e.message}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _updatePassword() async {
    if (!_formKey.currentState!.validate()) return;
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      await user!.updatePassword(_passwordController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully')),
      );
      _passwordController.clear();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update password: ${e.message}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    // Use pushReplacementNamed to prevent user from going back to home page
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const Text(
                    "Update Login Info",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a valid email' : null,
                  ),
                  const SizedBox(height: 8),
                  // Button Fix: Explicitly set foregroundColor to white
                  ElevatedButton(
                    onPressed: _updateEmail,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white),
                    child: const Text('Update Email'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'New Password'),
                    obscureText: true,
                    validator: (value) =>
                        value!.length < 6 ? 'Password too short' : null,
                  ),
                  const SizedBox(height: 8),
                  // Button Fix: Explicitly set foregroundColor to white
                  ElevatedButton(
                    onPressed: _updatePassword,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white),
                    child: const Text('Update Password'),
                  ),
                  const SizedBox(height: 40),
                  // Button Fix: Explicitly set foregroundColor to white
                  ElevatedButton(
                    onPressed: _logout,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white),
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            ),
          );
  }
}