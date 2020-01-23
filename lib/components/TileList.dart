import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileList extends StatelessWidget {
  final String LabelText;
  final String debugText;
  final Widget widget;

  TileList(this.LabelText,this.debugText,this.widget);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LabelText),
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