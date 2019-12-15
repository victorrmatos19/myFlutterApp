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
  final TextEditingController _controllerInputValue = TextEditingController();
  final TextEditingController _controllerInputNumberAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando Transferência"),),
      body: Column(
        children: <Widget>[
          Editor(controller: _controllerInputNumberAccount,labelText: "Numero da Conta",hintText: "0001",),
          Editor(controller: _controllerInputValue,labelText: "Valor",hintText: "0.00",icone: Icons.monetization_on,),
          RaisedButton(
            onPressed: () => _createTransfer(_controllerInputValue.text,_controllerInputNumberAccount.text),
            child: Text("Confirmar"),
          ),
        ],
      ),
    );
  }

  void _createTransfer(String inputValue, String InputNumberAccount) {
    final double value = double.tryParse(inputValue);
    final int numberAccount = int.tryParse(InputNumberAccount);

    if(value != null && numberAccount!= null ){
      final trasferenciaCriada = Transferencia(value, numberAccount);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData icone;

  Editor({this.controller, this.labelText, this.hintText,this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
            icon: icone != null ?  Icon(icone) : null,
            labelText: labelText,
            hintText: hintText,
        ),
        keyboardType: TextInputType.number,
      ),
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

  @override
  String toString() {
    return 'Transferencia{value: $value, numberAccount: $numberAccount}';
  }
}