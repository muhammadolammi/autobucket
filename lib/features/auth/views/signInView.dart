import 'dart:ui';

import 'package:autobucket/common/common.dart';
import 'package:autobucket/components/appbar.dart';
import 'package:autobucket/components/auth.dart';
import 'package:autobucket/components/customfield.dart';
import 'package:autobucket/features/auth/controller.dart';
import 'package:autobucket/features/auth/views/signUpView.dart';
import 'package:autobucket/features/home/view.dart';
import 'package:autobucket/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SignInView extends ConsumerStatefulWidget {
  static String route = 'signInRoute';
  const SignInView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  @override
  Widget build(BuildContext context) {
    final emailContoller = TextEditingController();
    final passwordContoller = TextEditingController();
    final isloading = ref.watch(authNotifierProvider);
    final auth = ref.watch(authNotifierProvider.notifier);
    void signInUser() {
      auth.signIn(
          password: passwordContoller.text,
          email: emailContoller.text,
          context: context);
    }

    return Scaffold(
      appBar: myAppBar,
      body: isloading
          ? const Loader()
          : Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 338,
                    height: 150,
                    margin: EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 14,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 14,
                    ),
                    child: Text(
                      "Hey there, Welcome back",
                      style: TextStyle(
                        color: Color(0xff161718),
                        fontFamily: "roboto",
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  CustomFormField(
                      labelText: "email", controller: emailContoller),
                  CustomFormField(
                      labelText: "password", controller: passwordContoller),
                  //forgot pass
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // alignment: Alignment.centerRight,
                          // width: 96,
                          // height: 14,
                          // margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(right: 15),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xff161718),
                              fontFamily: "roboto",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Sign In button
                  AuthButton(
                    labelText: "Sign In",
                    func: signInUser,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Don't have an account?",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(
                                  0xff161718,
                                ),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'roboto',
                              ),
                              children: [
                            TextSpan(
                              text: ' Sign Up',
                              style: const TextStyle(
                                color: Color(0xff297DFD),
                                fontSize: 16,
                                fontFamily: 'roboto',
                                fontWeight: FontWeight.w400,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("tapped");
                                  Navigator.pushNamed(
                                      context, SignUpView.route);
                                },
                            ),
                          ])),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
