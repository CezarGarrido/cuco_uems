import 'package:flutter/material.dart';
import 'login.dart';
import 'components/cadastro/aluno.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuco Uems',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        AlunoPage.routeName: (BuildContext context) => new AlunoPage(),
      },
    );
  }
}

void checkLogin() {}
