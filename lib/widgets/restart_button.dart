import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  const RestartButton(this._restart, {super.key});
  final void Function() _restart;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        icon: const Icon(
          Icons.restart_alt_outlined,
          color: Colors.white,
          size: 20,
        ),
        onPressed: _restart,
        label: const Text(
          "Restart Quize",
          style: TextStyle(
            color: Colors.white,
          ),
        ));
  }
}
