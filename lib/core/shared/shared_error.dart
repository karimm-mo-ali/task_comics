import 'package:flutter/material.dart';
import '../constants/assets.dart';

class SharedError extends StatelessWidget {
  const SharedError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(kErrorImage, fit: BoxFit.cover));
  }
}
