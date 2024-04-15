// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String labelText;
  final Function() func;
  const AuthButton({
    Key? key,
    required this.labelText,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: 366,
        height: 62,
        color: Color(0xff5F5F5F),
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 56,
        ),

        child: Center(
            child: Text(
          labelText,
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'inter',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        )),
        // style: ButtonStyle(),
      ),
    );
  }
}
