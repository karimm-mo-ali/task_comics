import 'package:flutter/material.dart';
import '../constants/styles.dart';

class SharedRichText extends StatelessWidget {
  final String title;
  final String day;
  final String month;
  final String year;
  const SharedRichText(
      {Key? key,
      required this.title,
      required this.day,
      required this.month,
      required this.year})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(text: title, style: kText21BoldBlack, children: [
      TextSpan(
        text: " At $day-$month-$year",
        style: kText16BoldBlack,
      )
    ]));
  }
}
