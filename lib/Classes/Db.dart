import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDb() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'personal_wallet_bevilaqua.db'),
    onCreate: (db, version) {
      db.execute(
          'CREATE TABLE IF NOT EXISTS account(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, balance REAL, initialBalance REAL)');
    },
    version: 1,
  );
  return await database;
}
