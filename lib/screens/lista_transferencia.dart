import 'package:flutter/material.dart';
import 'package:hello_world/components/TileList.dart';
import 'package:hello_world/models/ItemTransferencia.dart';
import 'package:hello_world/models/Transferencia.dart';
import 'package:hello_world/screens/tela_configuracoes.dart';
import 'package:hello_world/screens/tela_dashboard.dart';
import 'package:hello_world/screens/tela_meu_perfil.dart';
import 'package:hello_world/screens/tela_sair.dart';
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
          TileList("Meu Perfil","Click on Meu Perfil",TelaMeuPerfil()),
          TileList("Dashboard","Click on Dashboard",TelaDashboard()),
          TileList("Configurações","Click on Configurações",TelaConfiguracoes()),
          TileList("Sair","Click on Sair",TelaSair()),
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

