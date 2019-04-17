import 'package:projud_app/kernel/database.dart';

class Aluno {

  int id = 0;
  String nome = '';
  String email = '';
  String telefone = '';
  String cpf = '';
  String oab = '';
  String estado = '';
  String createdAt = '';
  String updatedAt = '';

  create(Aluno advogado) async {
    var conexao = new ConexaoSqlite();
    var db = await conexao.db;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM advogados");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into advogados (id,nome,oab)"
        " VALUES (?,?,?)",
        [id, advogado.nome, advogado.oab]);
    await db.close();
    return raw;
  }
  Future<List> getAll() async {
    var conexao = new ConexaoSqlite();
    var db = await conexao.db;
    //var result = await db.query(tableNote, columns: [columnId, columnTitle, columnDescription]);
    var result = await db.rawQuery('SELECT * FROM advogados');
    await db.close();
    return result.toList();
  }
}
