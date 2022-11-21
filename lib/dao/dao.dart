import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hub_ideias/models/note.dart';
import 'package:flutter_hub_ideias/widgets/card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getNotes() async {
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection('Notas').doc().get().then((value) => value.data());
}

List<CardWidget> cards = [
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
