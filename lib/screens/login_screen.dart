import 'package:flutter/material.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String _message = "";

  void _login() async {
    setState(() => _loading = true);
    final result = await ApiService.login(
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      _loading = false;
      _message = result["message"] ?? "Login success!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            _loading ? CircularProgressIndicator() : ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
            ),
            SizedBox(height: 10),
            Text(_message, style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
