import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/dao/dao.dart';
import 'package:flutter_hub_ideias/models/note.dart';
import 'package:flutter_hub_ideias/widgets/card.dart';

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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: getNotes(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("Nenhuma nota encontrada"),
              );
            } else {
              final List<NoteModel> notes =
                  NoteModel.mapToObjectList(snapshot.data!.docs);
              final List<CardWidget> cards =
                  CardWidget.listNoteToListCard(notes);
              return Wrap(
                children: cards,
              );
            }
          }),
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
