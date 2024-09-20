import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tema1/screens/login_screen.dart';
import '../providers/user_provider.dart';
import 'create_class_screen.dart';
import 'class_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Turmas"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).logout();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Center(child: Text("Bem-vindo ao Sistema Educacional!")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateClassScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
