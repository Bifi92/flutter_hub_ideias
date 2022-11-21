import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/dao/dao.dart';
import 'package:flutter_hub_ideias/models/note.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Wrap(
        children: cards,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-note',
              arguments: NoteModel(title: "", content: ""));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
