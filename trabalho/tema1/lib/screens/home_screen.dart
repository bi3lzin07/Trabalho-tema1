import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../providers/class_provider.dart';
import 'class_list_screen.dart';
import 'create_class_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final classProvider = Provider.of<ClassProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo, ${userProvider.isAuthenticated ? userProvider.user?.email : ''}"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              userProvider.logout();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Gerenciamento de Turmas",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateClassScreen()));
              },
              child: Text('Cadastrar Nova Turma'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassListScreen()));
              },
              child: Text('Listar Turmas'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: classProvider.classes.isEmpty
                  ? Center(child: Text("Nenhuma turma cadastrada ainda."))
                  : ListView.builder(
                      itemCount: classProvider.classes.length,
                      itemBuilder: (context, index) {
                        final classItem = classProvider.classes[index];
                        return ListTile(
                          title: Text(classItem.name),
                          onTap: () {
                            // Navegar para atividades da turma (implementar depois)
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
