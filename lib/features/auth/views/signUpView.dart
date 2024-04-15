import 'package:autobucket/common/common.dart';
import 'package:autobucket/components/appbar.dart';
import 'package:autobucket/components/auth.dart';
import 'package:autobucket/components/customfield.dart';
import 'package:autobucket/features/auth/controller.dart';
import 'package:autobucket/features/auth/views/signInView.dart';
import 'package:autobucket/models/user.dart';
import 'package:autobucket/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpView extends ConsumerStatefulWidget {
  static String route = 'signupRoute';
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final emailContoller = TextEditingController();
    final genderContoller = TextEditingController();

    final nameContoller = TextEditingController();

    final passwordContoller = TextEditingController();
    final auth = ref.watch(authNotifierProvider.notifier);
    final isloading = ref.watch(authNotifierProvider);
    void signUpUser() {
      auth.signUp(
          user: UserModel(
              name: nameContoller.text,
              email: emailContoller.text,
              password: passwordContoller.text,
              isWorker: false,
              isAdmin: false,
              profilePic: "",
              gender: genderContoller.text),
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
                      "Hey there, Welcome OnBoard",
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
                  //TODO Determine How to get Name and Gender
                  // CustomFormField(labelText: "name", controller: nameContoller),
                  // CustomFormField(
                  //     labelText: "gender", controller: genderContoller),
                  AuthButton(labelText: "Sign Up", func: signUpUser),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Already have an account?",
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
                              text: ' Sign In',
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
                                      context, SignInView.route);
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
