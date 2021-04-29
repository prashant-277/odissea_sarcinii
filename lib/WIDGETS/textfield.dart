import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odiseea_sarcinii/constants.dart';

class textfield extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final Function functionValidate;
  final String parametersValidate;

  const textfield({
    this.textInputType,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.functionValidate,
    this.parametersValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        child: TextFormField(
          cursorColor: buttonColor,
          maxLines: 1,
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: "OpenSans", color: kblack),
          obscureText: obscureText,
          controller: controller,
          inputFormatters: [FilteringTextInputFormatter.deny(new RegExp(r" "))],
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: kGray, width: 1)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: kGray, width: 1)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: kGray,
                  width: 1.0,
                ),
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: "OpenSans",
              ),
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon),
          validator: (value) {
            if (functionValidate != null) {
              String resultValidate =
                  functionValidate(value, parametersValidate);
              if (resultValidate != null) {
                return resultValidate;
              }
            }
            return null;
          },
        ),
      ),
    );
  }
}

String commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return null;
}

String requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return null;
}
