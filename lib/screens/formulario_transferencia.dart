import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/components/Editor.dart';
import 'package:hello_world/models/Transferencia.dart';

const String _tituloAppBar = "Criando Transferência";
const String _textButton = "Confirmar";

class FormularioTransferencia  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controllerInputValue = TextEditingController();
  final TextEditingController _controllerInputNumberAccount = TextEditingController();
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: _controllerInputNumberAccount,labelText: "Numero da Conta",hintText: "0001",),
            Editor(controller: _controllerInputValue,labelText: "Valor",hintText: "0.00",icone: Icons.monetization_on,),
            RaisedButton(
              onPressed: () => _createTransfer(_controllerInputValue.text,_controllerInputNumberAccount.text,context),
              child: Text(_textButton),
            ),
          ],
        ),
      ),
    );
  }
  void _createTransfer(String inputValue, String InputNumberAccount, BuildContext context) {
    final double value = double.tryParse(inputValue);
    final int numberAccount = int.tryParse(InputNumberAccount);

    if(value != null || numberAccount!= null ){
      final trasferenciaCriada = Transferencia(value, numberAccount);
      Navigator.pop(context, trasferenciaCriada);
    }
  }

}