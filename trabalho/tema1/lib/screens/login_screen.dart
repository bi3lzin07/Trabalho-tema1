import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isValidEmail(String email) {
    // Regex para validar o formato do email
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    return RegExp(emailPattern).hasMatch(email);
  }

  bool isValidPassword(String password) {
    // Regex para garantir que a senha contenha pelo menos um caractere especial
    String passwordPattern = r'^(?=.*[!@#$%^&*()_+{}:"<>?]).{8,}$';
    return RegExp(passwordPattern).hasMatch(password);
  }

  void login(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;

    if (!isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email inválido')));
      return;
    }

    if (!isValidPassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('A senha deve ter pelo menos 8 caracteres e conter um caractere especial.')));
      return;
    }

    Provider.of<UserProvider>(context, listen: false).login(email, password);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => login(context),
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
