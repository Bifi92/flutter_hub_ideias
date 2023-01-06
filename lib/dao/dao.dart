import 'package:flutter_hub_ideias/utils/constants/constants.dart';
import 'package:flutter_hub_ideias/models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Stream<QuerySnapshot<Map<String, dynamic>>> getNotes() {
  return _firestore
      .collection(C_NOTAS)
      .orderBy(F_NOTA_TITULO, descending: true)
      .snapshots();
}

Future<void> saveNote(NoteModel note) async {
  final noteId = _firestore.collection(C_NOTAS).doc().id;

  if (note.id != L_VAZIO) {
    _firestore
        .collection(C_NOTAS)
        .where(F_NOTA_ID, isEqualTo: note.id)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> snapshot) async {
      if (snapshot.docs.isEmpty) return;
      for (DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        await doc.reference.update(note.toDoc());
      }
    });
  } else {
    _firestore.collection(C_NOTAS).add({
      F_NOTA_DONO: note.dono,
      F_NOTA_CONTEUDO: note.content,
      F_NOTA_TITULO: note.title,
      F_NOTA_ID: noteId,
      F_NOTA_UUID: note.uuid,
      F_DESENVOLVEDOR: note.desenvolvedor,
      F_CONTEUDO_DESENVOLVEDOR: note.conteudoDesenvolvedor,
      F_NOME_DESENVOLVEDOR: note.nomeDesenvolvedor,
    });
  }
}

void deleteNote(String idNota) {
  _firestore
      .collection(C_NOTAS)
      .where(F_NOTA_ID, isEqualTo: idNota)
      .get()
      .then((QuerySnapshot<Map<String, dynamic>> snapshot) async {
    if (snapshot.docs.isEmpty) return;
    for (DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      await doc.reference.delete();
    }
  });
}

void implementarNota(String idNota, String uuid, String nomeDesenvolvedor) {
  _firestore
      .collection(C_NOTAS)
      .where(F_NOTA_ID, isEqualTo: idNota)
      .get()
      .then((QuerySnapshot<Map<String, dynamic>> snapshot) async {
    if (snapshot.docs.isEmpty) return;
    for (DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      await doc.reference.update({F_DESENVOLVEDOR: uuid});
      await doc.reference.update({F_NOME_DESENVOLVEDOR: nomeDesenvolvedor});
    }
  });
}
