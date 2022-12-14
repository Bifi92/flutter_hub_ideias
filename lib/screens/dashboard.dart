import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/utils/constants/constants.dart';
import 'package:flutter_hub_ideias/dao/dao.dart';
import 'package:flutter_hub_ideias/models/note.dart';
import 'package:flutter_hub_ideias/utils/utils.dart';
import 'package:flutter_hub_ideias/utils/widgets/card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacementNamed(context, R_LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$L_DASHBOARD: ${getUserName()}'),
        actions: [
          IconButton(
              onPressed: () {
                logout(context);
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: getNotes(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(L_NENHUMA_NOTA_ENCONTRADA),
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
          Navigator.pushNamed(context, R_CREATE_NOTE,
              arguments: NoteModel(
                id: L_VAZIO,
                title: L_VAZIO,
                content: L_VAZIO,
                dono: L_VAZIO,
                uuid: L_VAZIO,
                desenvolvedor: L_VAZIO,
                conteudoDesenvolvedor: L_VAZIO,
                nomeDesenvolvedor: L_VAZIO,
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
