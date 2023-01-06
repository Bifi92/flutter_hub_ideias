import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/utils/constants/constants.dart';
import 'package:flutter_hub_ideias/models/note.dart';
import 'package:flutter_hub_ideias/utils/utils.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({required this.note, super.key});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          if (note.desenvolvedor == '' ||
              note.desenvolvedor == getUserId() ||
              note.uuid == getUserId()) {
            Navigator.pushNamed(context, R_EDIT_NOTE, arguments: note);
          }
        },
        child: SizedBox(
          height: 150,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Titulo: ${note.title}')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Dono: ${note.dono}')),
              ),
              note.desenvolvedor != ''
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child:
                              Text('Desenvolvedor: ${note.nomeDesenvolvedor}')),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  static List<CardWidget> listNoteToListCard(List<NoteModel> notes) {
    List<CardWidget> cards = [];
    for (NoteModel element in notes) {
      cards.add(CardWidget(note: element));
    }
    return cards;
  }
}
