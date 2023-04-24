import 'package:flutter/material.dart';

class InstructionsLabel extends StatelessWidget {
  final String text;
  const InstructionsLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
