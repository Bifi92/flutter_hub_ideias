import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/dao/dao.dart';
import 'package:flutter_hub_ideias/models/note.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({required this.acao, super.key});

  final String acao;

  _setArguments(
      context, titleTextFormFieldController, contentTextFormFieldController) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;

    titleTextFormFieldController.text = note.title;
    contentTextFormFieldController.text = note.content;
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleTextFormFieldController =
        TextEditingController();

    final TextEditingController contentTextFormFieldController =
        TextEditingController();

    final formKey = GlobalKey<FormState>();
    //getNotes();

    _setArguments(
      context,
      titleTextFormFieldController,
      contentTextFormFieldController,
    );

    onSave() {
      formKey.currentState?.validate();
      debugPrint(titleTextFormFieldController.text);
      debugPrint(contentTextFormFieldController.text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$acao Nota'),
        actions: [
          IconButton(
              onPressed: () {
                onSave();
              },
              icon: const Icon(Icons.check),
              tooltip: 'Salvar'),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_forever),
              tooltip: 'Deletar')
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
                    hintText: "Título",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                  ),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo obrigatório";
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
                    hintText: "Conteúdo",
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
