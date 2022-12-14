import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hub_ideias/utils/constants/constants.dart';

class NoteModel {
  late String id;
  late String title;
  late String content;
  late String dono;
  late String uuid;
  late String desenvolvedor;
  late String conteudoDesenvolvedor;
  late String nomeDesenvolvedor;
  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.dono,
    required this.uuid,
    required this.desenvolvedor,
    required this.conteudoDesenvolvedor,
    required this.nomeDesenvolvedor,
  });

  static mapToObjectList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    List<NoteModel> response = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs) {
      response.add(
        NoteModel(
          id: doc[F_NOTA_ID],
          title: doc[F_NOTA_TITULO],
          content: doc[F_NOTA_CONTEUDO],
          dono: doc[F_NOTA_DONO],
          uuid: doc[F_NOTA_UUID],
          desenvolvedor: doc[F_DESENVOLVEDOR],
          conteudoDesenvolvedor: doc[F_CONTEUDO_DESENVOLVEDOR],
          nomeDesenvolvedor: doc[F_NOME_DESENVOLVEDOR],
        ),
      );
    }
    return response;
  }

  Map<String, dynamic> toDoc() {
    return {
      F_NOTA_ID: id,
      F_NOTA_TITULO: title,
      F_NOTA_CONTEUDO: content,
      F_NOTA_DONO: dono,
      F_NOTA_UUID: uuid,
      F_DESENVOLVEDOR: desenvolvedor,
      F_CONTEUDO_DESENVOLVEDOR: conteudoDesenvolvedor,
      F_NOME_DESENVOLVEDOR: nomeDesenvolvedor,
    };
  }
}
