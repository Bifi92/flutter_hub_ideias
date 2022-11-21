import 'package:flutter/cupertino.dart';
import 'package:flutter_hub_ideias/screens/dashboard.dart';
import 'package:flutter_hub_ideias/screens/note.dart';

Map<String, WidgetBuilder> rotes = {
  "/": (context) => const DashboardScreen(),
  "/edit-note": (context) => const NoteScreen(acao: 'Editar'),
  "/create-note": (context) => const NoteScreen(acao: 'Criar')
};
