import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  late String title;
  late String content;
  NoteModel({required this.title, required this.content});

  static mapToObjectList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    List<NoteModel> response = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs) {
      response.add(NoteModel(title: doc['Titulo'], content: doc['Conteudo']));
    }
    return response;
  }
}
