import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color_manager.dart';

class CustomFormField extends StatelessWidget {
  final String? Function(String?)? validator;

  final String? label;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? initialValue;
  final int? maxLines;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? autofocus;
  final Function()? onTap;
  final bool? readOnly;
  final double? borderRadius;
  final Color? primaryColor;
  const CustomFormField({
    Key? key,
    this.focusNode,
    this.validator,
    this.label,
    this.onFieldSubmitted,
    this.maxLines,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.hintText,
    this.enabled,
    this.inputFormatters,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.autofocus,
    this.initialValue,
    this.onTap,
    this.readOnly,
    this.borderRadius,
    this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xff07070B).withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTap: onTap,
        initialValue: initialValue,
        autofocus: autofocus ?? false,
        obscureText: obscureText ?? false,
        focusNode: focusNode,
        enabled: enabled ?? true,
        inputFormatters: inputFormatters,
        maxLines: maxLines ?? 1,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: primaryColor ?? ColorManager.primary,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        controller: controller,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        style: TextStyle(
          color: Color(0x0FFC2B7CD),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          suffixIcon: suffixIcon,
          label: label != null ? Text(label ?? '') : null,
          // hintText: 'Search here...',
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Color(0xff07070B).withOpacity(0.4),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.only(left: 12.0, top: 20, bottom: 20),
        ),
      ),
    );
  }
}
