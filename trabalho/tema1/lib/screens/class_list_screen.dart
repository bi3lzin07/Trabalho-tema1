import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/class_provider.dart';

class ClassListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final classProvider = Provider.of<ClassProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Turmas")),
      body: ListView.builder(
        itemCount: classProvider.classes.length,
        itemBuilder: (context, index) {
          final classItem = classProvider.classes[index];
          return ListTile(
            title: Text(classItem.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                classProvider.removeClass(classItem.id);
              },
            ),
            onTap: () {
              // Navegar para atividades da turma
            },
          );
        },
      ),
    );
  }
}
