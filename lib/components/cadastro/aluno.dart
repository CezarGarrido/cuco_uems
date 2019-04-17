import 'package:flutter/material.dart';
import 'package:projud_app/models/aluno.dart';
import 'dart:async';

class AlunoPage extends StatelessWidget {
  static const String routeName = "/cadastro/advogado";
  final _aluno = Aluno();
  final TextEditingController _nomeController = new TextEditingController();

  void teste() async {
    _aluno.nome = 'cezar';
    _aluno.oab = "12345";
    _aluno.cpf = "12343234234";
    _aluno.create(_aluno);
    print('=== getAll() ===');
    //também funciona
    /*_advogado.getAll().then((result) {
     // result é o retorno.
      print('=== result ===');
      print(result);
    });*/
    var advs = await _aluno.getAll();
    print('=== advs ===');
    advs.forEach((note) => print(note));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Novo cadastro"),
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(hintText: "Nome"),
              controller: _nomeController,
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Telefone",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.description),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Rgm",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.lock),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Senha",
              ),
            ),
          ),
          const Divider(
            height: 2.0,
          ),
          new RaisedButton(
            child: new Text(
              'Salvar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: teste,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
