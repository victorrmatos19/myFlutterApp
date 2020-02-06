import 'package:flutter/material.dart';

import 'Transferencia.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.value.toString()),
          subtitle: Text(_transferencia.numberAccount.toString() +" - "+ _transferencia.date.toString()),
        )
    );
  }
}