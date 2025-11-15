import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String _message = "";

  void _register() async {
    setState(() => _loading = true);
    final result = await ApiService.register(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      _loading = false;
      _message = result["message"] ?? "Registration complete!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            _loading ? CircularProgressIndicator() : ElevatedButton(
              onPressed: _register,
              child: Text("Register"),
            ),
            SizedBox(height: 10),
            Text(_message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
