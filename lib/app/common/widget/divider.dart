import 'package:flutter/material.dart';

class LeonDivider extends StatelessWidget {
  const LeonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0.5,
      thickness: 0.5,
      indent: 0,
      endIndent: 0,
      color: Colors.black,
    );
  }
}
