import 'package:flutter/material.dart';

class HelperList extends StatelessWidget {
  const HelperList({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: child,
    );
  }
}
