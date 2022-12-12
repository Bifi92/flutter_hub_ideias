import 'package:flutter/cupertino.dart';
import 'package:flutter_hub_ideias/utils/constants/constants.dart';
import 'package:flutter_hub_ideias/screens/dashboard.dart';
import 'package:flutter_hub_ideias/screens/login.dart';
import 'package:flutter_hub_ideias/screens/note.dart';
import 'package:flutter_hub_ideias/screens/signin.dart';

Map<String, WidgetBuilder> rotes = {
  R_DASHBOARD: (context) => const DashboardScreen(),
  R_EDIT_NOTE: (context) => const NoteScreen(acao: L_EDITAR),
  R_CREATE_NOTE: (context) => const NoteScreen(acao: L_CRIAR),
  R_LOGIN: (context) => const LogInScreen(),
  R_SIGNIN: (context) => const SignInScreen(),
};
