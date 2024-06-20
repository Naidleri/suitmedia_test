import 'package:flutter/material.dart';

class PublicButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PublicButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 43, 99, 123),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
