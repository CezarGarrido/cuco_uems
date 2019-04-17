import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class ConexaoSqlite {
  static final ConexaoSqlite _instance = new ConexaoSqlite.internal();
  factory ConexaoSqlite() => _instance;
  static Database _db;
  ConexaoSqlite.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE advogados(id INTEGER PRIMARY KEY, nome TEXT, oab TEXT)');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
