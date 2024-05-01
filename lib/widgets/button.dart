import 'package:flutter/material.dart';
import 'package:totalx_machine_task/helper/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const ButtonWidget({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(cWhiteColor),
        backgroundColor: MaterialStateProperty.all<Color>(cBlackColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
