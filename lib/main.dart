import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando Transferência"),),
      body: Text("Teste"),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transferências"),),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.00,1000)),
          ItemTransferencia(Transferencia(300.00,2030)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

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