import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hub_ideias/constants/constants.dart';

class NoteModel {
  late String id;
  late String title;
  late String content;
  NoteModel({required this.id, required this.title, required this.content});

  static mapToObjectList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    List<NoteModel> response = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs) {
      response.add(NoteModel(
          id: doc[F_NOTA_ID],
          title: doc[F_NOTA_TITULO],
          content: doc[F_NOTA_CONTEUDO]));
    }
    return response;
  }

  Map<String, dynamic> toDoc() {
    return {
      F_NOTA_ID: id,
      F_NOTA_TITULO: title,
      F_NOTA_CONTEUDO: content,
    };
  }
}
