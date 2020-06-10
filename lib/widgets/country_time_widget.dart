import 'package:analog_clock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CountryTimeTileWidget extends StatelessWidget {
  final String imagePath, name, time, timeZone;

  const CountryTimeTileWidget(
      {Key key,
      @required this.imagePath,
      @required this.name,
      @required this.time,
      @required this.timeZone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        width: getProportionateScreenWidth(270),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: Theme.of(context).primaryIconTheme.color, width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 14),
              ),
              Text(timeZone),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    imagePath,
                    color: Theme.of(context).primaryIconTheme.color,
                    width: getProportionateScreenWidth(45),
                  ),
                  Text(
                    time,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 23),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
