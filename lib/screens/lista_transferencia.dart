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
      drawer: Drawer(child: ListView(
        children: <Widget>[
          Icon(Icons.account_circle, size: 60.0,),
          ListTile(
            title: Text("Meu Perfil"),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              debugPrint("Click on Meu Perfil");
            },
          ),
          ListTile(
            title: Text("Dashboard"),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              debugPrint("Click on Dashboard");
            },
          ),
          ListTile(
            title: Text("Configurações"),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              debugPrint("Click on Configurações");
            },
          ),
          ListTile(
            title: Text("Sair"),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              debugPrint("Click on Sair");
            },
          ),
        ],
      ),),
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