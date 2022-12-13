import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/utils/constants/constants.dart';
import 'package:flutter_hub_ideias/dao/dao.dart';
import 'package:flutter_hub_ideias/models/note.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({required this.acao, super.key});

  final String acao;

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static final TextEditingController titleTextFormFieldController =
      TextEditingController();

  static final TextEditingController contentTextFormFieldController =
      TextEditingController();

  static final TextEditingController idTextFormFieldController =
      TextEditingController();

  _setArguments(context, titleTextFormFieldController,
      contentTextFormFieldController, idTextFormFieldController) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;

    titleTextFormFieldController.text = note.title;
    contentTextFormFieldController.text = note.content;
    idTextFormFieldController.text = note.id;
  }

  @override
  Widget build(BuildContext context) {
    _setArguments(
      context,
      titleTextFormFieldController,
      contentTextFormFieldController,
      idTextFormFieldController,
    );

    onSave() {
      formKey.currentState?.validate();
      saveNote(
        NoteModel(
            id: idTextFormFieldController.text,
            title: titleTextFormFieldController.text,
            content: contentTextFormFieldController.text),
      );
      Navigator.pop(context);
    }

    onDelete() {
      deleteNote(idTextFormFieldController.text);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$acao $L_NOTA'),
        actions: [
          IconButton(
              onPressed: () {
                onSave();
              },
              icon: const Icon(Icons.check),
              tooltip: L_SALVAR),
          IconButton(
              onPressed: () {
                onDelete();
              },
              icon: const Icon(Icons.delete_forever),
              tooltip: L_DELETAR)
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleTextFormFieldController,
                  decoration: const InputDecoration(
                    hintText: L_TITULO,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                  ),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return L_CAMPO_OBRIGATORIO;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: null,
                  minLines: 25,
                  controller: contentTextFormFieldController,
                  decoration: const InputDecoration(
                    hintText: L_CONTEUDO,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
