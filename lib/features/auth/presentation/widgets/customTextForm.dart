import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class TextFField extends StatelessWidget {
  const TextFField({Key? key, required this.labelText, this.onChanged, this.onFieldSubmitted,this.suffixIcon, this.obscureText,}) : super(key: key);
  final String labelText;
  final Function (String)? onChanged;
  final Function (String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:24 ,right: 8,left: 8),
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty){
            return "This Field is requierd";
          }else{return null;}
        },
        onChanged:onChanged ,
        onFieldSubmitted:onFieldSubmitted ,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          suffixIcon:suffixIcon ,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontFamily: "Poppins",
          ),
          border: getBordrStyle(),
          enabledBorder: getBordrStyle(),
          focusedBorder: getBordrStyle(),

        ),
      ),
    );
  }
}

OutlineInputBorder getBordrStyle(){
  return  OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: Colors.grey)
  );
}
