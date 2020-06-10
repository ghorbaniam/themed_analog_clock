import 'dart:async';

import 'package:analog_clock/size_config.dart';
import 'package:analog_clock/widgets/analog_clock_widget.dart';
import 'package:analog_clock/widgets/country_time_widget.dart';
import 'package:analog_clock/widgets/digital_clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (TimeOfDay.now().minute != _timeOfDay.minute) {
        setState(() => _timeOfDay = TimeOfDay.now());
      }
      setState(() => _dateTime = DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBarWidget(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tehran, IR | PST',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            DigitalClockWidget(timeOfDay: _timeOfDay),
            SizedBox(height: 10),
            AnalogClockWidget(time: _dateTime),
            SizedBox(height: 10),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    CountryTimeTileWidget(
                      imagePath: 'assets/icons/Liberty.svg',
                      timeZone: '-7:30 HRS | EST',
                      time: '09:32',
                      name: 'New York, USA',
                    ),
                    CountryTimeTileWidget(
                      imagePath: 'assets/icons/Sydney.svg',
                      timeZone: '+10 HRS | AEST',
                      time: '23:50',
                      name: 'Sydney NSW, Australia',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBarWidget(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/Settings.svg'),
        color: Theme.of(context).iconTheme.color,
        onPressed: () {},
      ),
      actions: [AddButtonWidget()],
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      width: getProportionateScreenWidth(32),
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white70),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
