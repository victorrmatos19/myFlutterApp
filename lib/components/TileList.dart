import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileList extends StatelessWidget {
  final String labelText;
  final String debugText;
  final Widget widget;

  TileList(this.labelText,this.debugText,this.widget);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(labelText),
      trailing: Icon(Icons.arrow_forward),
      onTap: (){
        debugPrint(debugText);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget;
        }));
      },
    );
  }
}