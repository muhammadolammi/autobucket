// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const CustomFormField({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      // height: 56,
      margin: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        border: Border.all(
          color: Color(0xFF79747E),
          width: 1,
        ),

        // borderRadius: BorderRadius.circular(8.0),

        // Set opacity to 0 to hide the container
        // Set to 1 to make it fully visible
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff6dc1ff),
              width: 2,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
          ),
        ),
      ),
    );
  }
}
