import 'package:flutter/material.dart';
import 'package:hello_world/models/ItemTransferencia.dart';
import 'package:hello_world/models/Transferencia.dart';
import 'formulario_transferencia.dart';

const String _tituloAppBar = "Transferências";

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _listTransfer = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar),),
      body: ListView.builder(
        itemCount: widget._listTransfer.length,
        itemBuilder: (context, indice){
          final _transferencia = widget._listTransfer[indice];
          return ItemTransferencia(_transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida)=>_atualiza(transferenciaRecebida));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if(transferenciaRecebida != null){
      setState(() {
        widget._listTransfer.add(transferenciaRecebida);
      });
    }
  }
}