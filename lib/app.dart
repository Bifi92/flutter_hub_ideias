import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/utils/constants/constants.dart';
import 'package:flutter_hub_ideias/routes/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: L_HUB_DE_IDEIAS,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: R_LOGIN,
      routes: rotes,
    );
  }
}
