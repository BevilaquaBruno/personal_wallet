import 'package:sqflite/sqflite.dart';
import 'package:personal_wallet/Classes/Account.dart';

class AccountModel {
  /// All accounts
  Future<List<Account>> getAll(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query('account');
    return List.generate(maps.length, (i) {
      return Account(
        id: maps[i]['id'],
        name: maps[i]['name'],
        balance: maps[i]['balance'],
        initialBalance: maps[i]['initialBalance'],
      );
    });
  }

  /// Specific account or Account with id = 0
  Future<Account> get(Database db, int id) async {
    final List<Map<String, dynamic>> coordenada = await db.rawQuery(
        'SELECT id, name, balance, initialBalance FROM account WHERE id = ? LIMIT 1',
        [id]);

    if (coordenada.isEmpty) {
      return const Account(id: 0, name: '', balance: 0.0, initialBalance: 0.0);
    } else {
      return Account(
        id: coordenada[0]['id'],
        name: coordenada[0]['name'],
        balance: coordenada[0]['balance'],
        initialBalance: coordenada[0]['initialBalance'],
      );
    }
  }

  /// Insert account
  void insert(Database db, Account account) async {
    await db.rawInsert(
      'INSERT INTO account (name, balance, initialBalance) VALUES (?, ?, ?)',
      [
        account.name,
        account.balance,
        account.initialBalance,
      ],
    );
  }

  /// update account
  void update(Database db, Account account) async {
    await db.rawUpdate('UPDATE account SET name = ? WHERE id = ?', [
      account.name,
    ]);
  }

  /// delete account
  Future<bool> delete(Database db, int id) async {
    int i = await db.rawDelete('DELETE FROM account WHERE id = ?', [id]);

    return true;
  }
}
