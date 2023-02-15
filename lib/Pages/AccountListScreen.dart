import 'package:flutter/material.dart';
import 'package:personal_wallet/Classes/Account.dart';

class AccountListScreen extends StatelessWidget {
  final List<Account> listAccount = [];
  AccountListScreen({super.key, required listAccount});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Lista de Contas aqui"),
    );
  }
}
