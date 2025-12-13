import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class CustomField extends StatelessWidget {
  Widget? prefixIcon;
  Widget? suffixIcon;
  String hintTxt;
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool obscureText ;
  final String? Function(String?)? validator;
  CustomField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintTxt,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.white,width: 1.5)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.white,width: 1.5)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.red,width: 1.5)
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintTxt,

      ),
    );
  }
}
