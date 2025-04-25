import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  final String _correctEmail =
      'sena@elective.com'; //here is the correct emal i used
  final String _correctPassword = '123456';

  String? _validateEmail(String? value) {
    return (value == null || value.isEmpty) ? 'Email is required' : null;
  }

  String? _validatePassword(String? value) {
    return (value == null || value.isEmpty) ? 'Password is required' : null;
  }

  void _validateLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_email == _correctEmail && _password == _correctPassword) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login successful!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Form',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.limeAccent),
        backgroundColor: const Color.fromARGB(255, 1, 44, 4),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(32.0),
            margin: const EdgeInsets.symmetric(horizontal: 300.0),
            decoration: BoxDecoration(
              color: Colors.lime,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'user@elective.com',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    onSaved: (value) => _email = value,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    obscureText: true,
                    validator: _validatePassword,
                    onSaved: (value) => _password = value,
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: _validateLogin,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 44, 4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
