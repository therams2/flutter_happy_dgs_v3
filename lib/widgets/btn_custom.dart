import 'package:flutter/material.dart';

class btn_custom extends StatelessWidget {
  final String text;
  final Function onPressed;
  const btn_custom({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: Color(0xFFFFD54F),
      shape: StadiumBorder(),
      onPressed: () => this.onPressed(),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(this.text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
      ),
    );
  }
}
