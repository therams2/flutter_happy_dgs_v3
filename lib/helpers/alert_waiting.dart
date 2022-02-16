import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


mostrarEspere( BuildContext context, String titulo, String subtitulo ) {

  if ( Platform.isAndroid ) {
    return showDialog(
        context: context,
        builder: ( _ ) => AlertDialog(
          title:  Center(child: CircularProgressIndicator()),
          content: Text( subtitulo ),
          actions: <Widget>[
            MaterialButton(
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => { })
          ],
        )
    );
  }

  showCupertinoDialog(
      context: context,
      builder: ( _ ) => CupertinoAlertDialog(
        title: Text( titulo ),
        content: Text( subtitulo ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      )
  );

}