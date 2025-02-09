// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color? colors;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 80)),
      child: Text(
        title,
        style: TextStyle(color: colors ?? Colors.white),
      ),
    );
  }
}
