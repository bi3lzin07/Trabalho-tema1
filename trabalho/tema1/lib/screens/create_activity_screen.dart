import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';

class CreateActivityScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Atividade")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Título')),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Descrição')),
            ElevatedButton(
              onPressed: () {
                Provider.of<ActivityProvider>(context, listen: false).addActivity(
                  titleController.text,
                  descriptionController.text,
                );
                Navigator.pop(context);
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
