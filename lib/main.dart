import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: ListaTrasferencia(),
      appBar: AppBar(title: Text("Transferências"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    ),
  )
);

class ListaTrasferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTrasferencia(Transferencia(100.00,1000)),
        ItemTrasferencia(Transferencia(300.00,2030)),
      ],
    );
  }
}

class ItemTrasferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTrasferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.value.toString()),
          subtitle: Text(_transferencia.numberAccount.toString()),
        )
    );
  }
}

class Transferencia {
  double value;
  int numberAccount;

  Transferencia(this.value,this.numberAccount);
}