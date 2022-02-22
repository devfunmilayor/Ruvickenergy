// @dart=2.9
import 'package:flutter/material.dart';

class RVCustomButtonWidget extends StatelessWidget {
  const RVCustomButtonWidget({
    Key key,
    @required this.onTap,
    @required this.title, @required this.width,
  }) : super(key: key);
  final Function onTap;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: width,
        child:  Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
