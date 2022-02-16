import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.orange, onPressed: () {},),
        body: SfCalendar(
          view: CalendarView.month,
          initialSelectedDate: DateTime.now(),
        ));
  }
}
