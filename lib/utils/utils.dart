import 'package:firebase_auth/firebase_auth.dart';

String getUserName() {
  var currentUser = FirebaseAuth.instance.currentUser;
  String nome = 'Anonimo';
  if (currentUser != null && currentUser.displayName != null) {
    nome = currentUser.displayName!;
  }
  return nome;
}

String getUserId() {
  var currentUser = FirebaseAuth.instance.currentUser;
  String uuid = '';
  if (currentUser != null) {
    uuid = currentUser.uid;
  }
  return uuid;
}
