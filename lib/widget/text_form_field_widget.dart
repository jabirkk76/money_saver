import 'package:flutter/material.dart';
import 'package:money_saver/helpers/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hint,
    required this.controller,
    required this.keyBoard,
    required this.validator,
  });
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyBoard;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyBoard,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: AppColors.white,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.hintColor, fontSize: 20),
      ),
    );
  }
}
