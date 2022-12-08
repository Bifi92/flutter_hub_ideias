import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/models/note.dart';

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
          Navigator.pushNamed(context, '/edit-note', arguments: note);
        },
        child: SizedBox(
          height: 100,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(note.title)),
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
