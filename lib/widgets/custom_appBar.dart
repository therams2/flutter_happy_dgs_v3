import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;

  @override
  final Size preferredSize;
  CustomAppBar(this._title, {Key? key}) : preferredSize = Size.fromHeight(50.0),super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.0),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Image.asset(
              'assets/happydogsbar.png',
              fit: BoxFit.fitWidth,
              width: 140.0,
            ),
          ),

          Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [

                    TextSpan(text: 'Lomas Santiaguito'),
                    WidgetSpan(
                      child: Icon(Icons.add_location_alt_sharp,
                          color: Color(0xFF17140B)),
                    ),

                    ],

                ),

              ),

          ),

        ],
      ),
    );
  }
}
