import 'package:flutter/material.dart';
Widget buildStrengthIndicator(String password) {
  int strength = calculatePasswordStrength(password: password);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 75,
        height: 3.5,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: strength == 1 ? Colors.red : strength == 2 ? Colors.orange : strength == 3 ? Colors.yellow:strength == 4 ? Colors.green : Color(0xFF353542),

        ),
      ),
      Container(
        width: 75,
        height: 3.5,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: strength == 2 ? Colors.orange : strength == 3 ? Colors.yellow:strength == 4 ? Colors.green: const Color(0xFF353542),
        ),
      ),
      Container(
        width: 75,
        height: 3.5,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: strength == 3 ? Colors.yellow :strength == 4 ? Colors.green: const Color(0xFF353542),
        ),
      ),
      Container(
        width: 75,
        height: 3.5,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: strength >= 4 ? Colors.green : const Color(0xFF353542),
        ),
      ),
    ],
  );
}

int calculatePasswordStrength({required String password}) {
  int strength = 0;
  // Example criteria: Check for at least 8 characters
  if (password.length >= 8) {
    strength++;
  }

  if (RegExp(r'[A-Z]').hasMatch(password)) {
    strength++;
  }

  if (RegExp(r'[0-9]').hasMatch(password)) {
    strength++;
  }

  if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
    strength++;
  }

  return strength;
}