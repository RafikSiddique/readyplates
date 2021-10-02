import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginTextField extends TextFormField {
  LoginTextField(
      {Key? key,
      TextEditingController? controller,
      String? Function(String?)? validation,
      String? hintText,
      BorderRadius borderRadius = const BorderRadius.all(Radius.circular(6))})
      : super(
          key: key,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(
              left: 12,
              top: 12,
            ),
            hintStyle: TextStyle(
              fontSize: 13,
              letterSpacing: -0.264706,
              color: Color(0xff2F2E41).withOpacity(0.7),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xffE0E0E0)),
              borderRadius: borderRadius,
            ),
          ),
          validator: validation,
        );
}
