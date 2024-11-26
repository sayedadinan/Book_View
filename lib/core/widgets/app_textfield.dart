import 'package:books_app/core/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? submitFun;
  final List<TextInputFormatter>? textInputFormatter;
  final Icon? prefixIcon;
  final int? maxLengths;
  final bool? isEnabled;
  final bool obscureText;
  final VoidCallback? togglePasswordVisibility;

  const Inputfield({
    this.textInputFormatter,
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.maxLengths,
    this.submitFun,
    this.isEnabled,
    required this.obscureText,
    this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : null,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: submitFun,
      inputFormatters: textInputFormatter,
      style: const TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.disabled,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(82, 136, 132, 136)),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(54, 38, 8, 37)),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade600),
            borderRadius: BorderRadius.circular(12)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade600),
            borderRadius: BorderRadius.circular(12)),
        hintText: hinttext,
        prefixIcon: prefixIcon,
        suffixIcon: togglePasswordVisibility != null
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color.fromARGB(255, 159, 150, 150),
                ),
                onPressed: togglePasswordVisibility,
              )
            : null, // Remove suffix if no toggle
        hintStyle: const TextStyle(color: Color.fromARGB(255, 159, 150, 150)),
        labelStyle: const TextStyle(color: AppColors.primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(90)),
      ),
      keyboardType: keyboardType,
    );
  }
}
