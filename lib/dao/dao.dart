import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hub_ideias/models/note.dart';
import 'package:flutter_hub_ideias/widgets/card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Stream<QuerySnapshot<Map<String, dynamic>>> getNotes() {
  return _firestore
      .collection('Notas')
      .orderBy('Titulo', descending: true)
      .snapshots();
}

List<CardWidget> cardss = [
  CardWidget(
    note: NoteModel(content: "Conteudo 1", title: "Titulo 1"),
  ),
  CardWidget(
    note: NoteModel(content: "", title: "Titulo 2"),
  ),
  CardWidget(
    note: NoteModel(content: "Conteudo 3", title: "Titulo 3"),
  ),
  CardWidget(
    note: NoteModel(content: "Conteudo 4", title: "Titulo 4"),
  ),
  CardWidget(
    note: NoteModel(content: "Conteudo 5", title: "Titulo 5"),
  )
];
