import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;
  const Logo({Key? key, required this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        margin: EdgeInsets.only(top: 0),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/19.png')),
            SizedBox(height: 10),
            Text(
              this.titulo,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Color(0XFF607D8B)),
            ),
          ],
        ),
      ),
    );
  }
}
