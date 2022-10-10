import 'package:flutter/material.dart';
import '../constants/styles.dart';

class SharedText extends StatelessWidget {
  final String alt;
  const SharedText({Key? key, required this.alt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      alt,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      style: kText18Black,
    );
  }
}
