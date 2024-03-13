import 'package:capstone/main.dart';
import 'package:capstone/src/util/util.dart';
import 'package:capstone/src/views/watchLiveScreen/WatchLiveScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userID = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60.0),
            Image.asset(
              'assets/archer.jpeg',
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 40.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  userID = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'User ID',
                hintText: '123456',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            PasswordTextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                _checkLogin();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Watch Live operations
                _watchLive();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                'Watch Live',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkLogin() {
    if (userID.isNotEmpty && password.isNotEmpty) {
      //Login operation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainApp()),
      );
    } else {
      showToast('User Id or Password cannot be left blank!');
    }
  }

  void _watchLive() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WatchLiveScreen()),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const PasswordTextField({super.key, this.onChanged});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '123456',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}

