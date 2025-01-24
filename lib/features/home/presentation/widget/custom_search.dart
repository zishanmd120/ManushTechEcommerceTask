import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.focusNode,
    required this.onChanged,
    required this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 16),
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
              focusNode: focusNode,
              onTapOutside: (value){
                FocusScope.of(context).unfocus();
              },
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