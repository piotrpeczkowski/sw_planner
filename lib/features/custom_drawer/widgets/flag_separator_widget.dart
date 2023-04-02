
import 'package:flutter/material.dart';

class FlagSeparatorWidget extends StatelessWidget {
  const FlagSeparatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 3,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        Container(
          height: 3,
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }
}
