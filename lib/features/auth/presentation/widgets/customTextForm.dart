import 'package:depi_final_project/core/utils/s/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFields extends StatelessWidget {
  const TextFormFields(
      {super.key, required this.labelText, required this.hintText,  this.controller});

  final String labelText;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 342.w,
      decoration: BoxDecoration(color: AppColors.gray),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color(0xffC6C6C6),
              fontWeight: FontWeight.w600,
              fontSize: 13),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Color(0xff00004D),
              fontWeight: FontWeight.w300,
              fontSize: 16),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),  // Added borderRadius
            borderSide: BorderSide(color: Color(0xffC6C6C6)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),  // Added borderRadius
            borderSide: BorderSide(color: Color(0xffC6C6C6)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),  // Added borderRadius
            borderSide: BorderSide(color: Colors.greenAccent),
          ),
        ),
      ),
    );
  }
}
