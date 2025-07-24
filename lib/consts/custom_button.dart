import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? cilcked;
  final String? title;
  final Color backgroundColor;
  const CustomButton(
      {super.key,
      this.cilcked,
      this.title,
      this.backgroundColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: cilcked,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)))),
      child: Text(
        title!,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
