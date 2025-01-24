import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.obscurePassword,
    required this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscurePassword;
  final String? Function(String?)? onChanged;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscurePassword,
              obscuringCharacter: '*',
              autofillHints: const <String>[AutofillHints.oneTimeCode],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            child: suffixIcon,
          )
        ],
      ),
    );
  }
}
