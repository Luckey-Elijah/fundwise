import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: context.error),
      onPressed: onPressed,
      child: const Text('Cancel'),
    );
  }
}
