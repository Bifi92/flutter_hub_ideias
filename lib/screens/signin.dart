import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/utils/constants/constants.dart';
import 'package:flutter_hub_ideias/utils/widgets/snack_bar.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailTextFormFieldController =
        TextEditingController();

    final TextEditingController senhaTextFormFieldController =
        TextEditingController();

    final formKey = GlobalKey<FormState>();

    signin(BuildContext context) async {
      formKey.currentState?.validate();
      String email = emailTextFormFieldController.text;
      String senha = senhaTextFormFieldController.text;

      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: senha)
            .then((value) {
          debugPrint(value.user?.uid);
          Navigator.pushNamedAndRemoveUntil(
              context, R_DASHBOARD, (route) => false);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == E_WEAK_PASSWORD) {
          showSnackBar(context, EM_WEAK_PASSWORD);
        } else if (e.code == E_EMAIL_ALREADY_IN_USE) {
          showSnackBar(context, EM_EMAIL_ALREADY_IN_USE);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(L_CADASTRO),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.50,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailTextFormFieldController,
                      decoration: const InputDecoration(
                        hintText: L_EMAIL,
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
                      controller: senhaTextFormFieldController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: L_SENHA,
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
                    child: ElevatedButton(
                      onPressed: () {
                        signin(context);
                      },
                      child: const Text(L_CADASTRAR),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
