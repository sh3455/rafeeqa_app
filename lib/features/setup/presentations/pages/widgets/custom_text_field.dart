import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, 
  required this.hintText,
  this.suffixIcon,
  this.suffixText, 
  required this.readOnly,
  this.onTap, 
  this.keyboardType, 
  this.controller
 }) ;

  final String hintText;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).hintColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
         TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: keyboardType,
          decoration:InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: color),
            suffixIcon: suffixIcon,
            suffixText: suffixText,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      
            
          ),
         )
        ],
      ),
    );
  }
}

