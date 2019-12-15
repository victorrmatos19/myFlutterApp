import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/lista_transferencia.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark(),
      home: ListaTransferencia(),
    );
  }
}