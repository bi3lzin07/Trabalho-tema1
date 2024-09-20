import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';
import 'create_activity_screen.dart';

class ClassActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activityProvider = Provider.of<ActivityProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Atividades")),
      body: ListView.builder(
        itemCount: activityProvider.activities.length,
        itemBuilder: (context, index) {
          final activity = activityProvider.activities[index];
          return ListTile(title: Text(activity.title));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateActivityScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
