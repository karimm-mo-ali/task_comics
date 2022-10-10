import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  const SharedButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
        alignment: Alignment.center,
        child: Padding(
          padding: icon == Icons.arrow_back_ios
              ? const EdgeInsets.only(left: 5)
              : const EdgeInsets.all(0.0),
          child: Icon(icon),
        ),
      ),
    );
  }
}
