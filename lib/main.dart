import 'package:flutter/material.dart';
import 'package:personal_wallet/Classes/Account.dart';
import 'package:personal_wallet/Models/AccountModel.dart';
import 'package:personal_wallet/Pages/AccountListScreen.dart';
import 'package:personal_wallet/Pages/InitialScreen.dart';

import 'Classes/Db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = await getDb();

  Account ac1 =
      const Account(id: 1, name: 'A', balance: 219.4, initialBalance: 100.0);
  Account ac2 =
      const Account(id: 2, name: 'B', balance: 222.4, initialBalance: 99.0);

  AccountModel accountModel = AccountModel();
  accountModel.insert(db, ac1);
  accountModel.insert(db, ac2);

  runApp(const PersonalWallet(
    startScreen: InitialScreen(),
  ));
}

class PersonalWallet extends StatelessWidget {
  final Widget startScreen;
  const PersonalWallet({super.key, required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: startScreen,
    );
  }
}
