import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DigitalClockWidget extends StatelessWidget {
  final TimeOfDay timeOfDay;

  const DigitalClockWidget({Key key, @required this.timeOfDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _period = timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${timeOfDay.hourOfPeriod.toString().padLeft(2, '0')} : ${timeOfDay.minute.toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: 5),
        RotatedBox(quarterTurns: 3, child: Text(_period)),
      ],
    );
  }
}
