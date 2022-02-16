part of 'widgets.dart';

class BtnCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10 ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon( Icons.calendar_today, color: Colors.black87 ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => Calendar()
            );
          },
        ),
      ),
    );
  }
}
