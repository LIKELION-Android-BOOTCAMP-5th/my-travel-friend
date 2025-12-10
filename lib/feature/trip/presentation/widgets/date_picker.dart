import 'package:flutter/material.dart';

class DatePickerBox extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const DatePickerBox({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          value.isEmpty ? label : value,
          style: TextStyle(
            color: value.isEmpty ? Colors.grey : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
