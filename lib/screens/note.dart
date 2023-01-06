import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/utils/constants/constants.dart';
import 'package:flutter_hub_ideias/dao/dao.dart';
import 'package:flutter_hub_ideias/models/note.dart';
import 'package:flutter_hub_ideias/utils/utils.dart';

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

  static final TextEditingController donoTextFormFieldController =
      TextEditingController();

  static final TextEditingController uuidTextFormFieldController =
      TextEditingController();

  static final TextEditingController desenvolvedorTextFormFieldController =
      TextEditingController();

  static final TextEditingController
      conteudoDesenvolvedorTextFormFieldController = TextEditingController();

  _setArguments(
      context,
      titleTextFormFieldController,
      contentTextFormFieldController,
      idTextFormFieldController,
      donoTextFormFieldController,
      uuidTextFormFieldController,
      desenvolvedorTextFormFieldController,
      conteudoDesenvolvedorTextFormFieldController) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;

    titleTextFormFieldController.text = note.title;
    contentTextFormFieldController.text = note.content;
    idTextFormFieldController.text = note.id;
    donoTextFormFieldController.text = note.dono;
    uuidTextFormFieldController.text = note.uuid;
    desenvolvedorTextFormFieldController.text = note.desenvolvedor;
    conteudoDesenvolvedorTextFormFieldController.text =
        note.conteudoDesenvolvedor;
  }

  @override
  Widget build(BuildContext context) {
    _setArguments(
      context,
      titleTextFormFieldController,
      contentTextFormFieldController,
      idTextFormFieldController,
      donoTextFormFieldController,
      uuidTextFormFieldController,
      desenvolvedorTextFormFieldController,
      conteudoDesenvolvedorTextFormFieldController,
    );

    onSave() {
      formKey.currentState?.validate();
      saveNote(
        NoteModel(
          id: idTextFormFieldController.text,
          title: titleTextFormFieldController.text,
          content: contentTextFormFieldController.text,
          dono: donoTextFormFieldController.text != ''
              ? donoTextFormFieldController.text
              : getUserName(),
          uuid: uuidTextFormFieldController.text != ''
              ? uuidTextFormFieldController.text
              : getUserId(),
          desenvolvedor: desenvolvedorTextFormFieldController.text,
          conteudoDesenvolvedor:
              conteudoDesenvolvedorTextFormFieldController.text,
        ),
      );
      Navigator.pop(context);
    }

    onDelete() {
      deleteNote(idTextFormFieldController.text);
      Navigator.pop(context);
    }

    onImplementar() {
      implementarNota(idTextFormFieldController.text, getUserId());
      Navigator.pop(context);
    }

    bool usuarioAtual = uuidTextFormFieldController.text == '' ||
        uuidTextFormFieldController.text == getUserId();

    bool semDesenvolvedor = desenvolvedorTextFormFieldController.text == '';

    bool desenvolvedorAtual =
        desenvolvedorTextFormFieldController.text == getUserId();

    return Scaffold(
      appBar: AppBar(
        title: const Text(L_NOTA),
        actions: usuarioAtual || desenvolvedorAtual
            ? [
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
              ]
            : [],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                widthFactor: 1,
                child: Text(
                  usuarioAtual
                      ? getUserName()
                      : donoTextFormFieldController.text,
                  style: const TextStyle(fontSize: 50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enabled: usuarioAtual,
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
                  enabled: usuarioAtual,
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
              ),
              (usuarioAtual && !semDesenvolvedor) || desenvolvedorAtual
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enabled: desenvolvedorAtual,
                        maxLines: null,
                        minLines: 25,
                        controller:
                            conteudoDesenvolvedorTextFormFieldController,
                        decoration: const InputDecoration(
                          hintText: L_CONTEUDO_DESENVOLVEDOR,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                    )
                  : Container(),
              !usuarioAtual && semDesenvolvedor
                  ? SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            onImplementar();
                          },
                          child: const Text("Implementar")),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
