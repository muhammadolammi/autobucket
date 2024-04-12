import 'package:autobucket/common/common.dart';
import 'package:autobucket/components/appbar.dart';
import 'package:autobucket/components/customfield.dart';
import 'package:autobucket/features/auth/controller.dart';
import 'package:autobucket/features/auth/views/signUpView.dart';
import 'package:autobucket/features/home/view.dart';
import 'package:autobucket/provider.dart';
import 'package:flutter/gestures.dart';
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

    return Scaffold(
      appBar: myAppBar,
      body: isloading
          ? const Loader()
          : Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomFormField(
                      labelText: "email", controller: emailContoller),
                  CustomFormField(
                      labelText: "password", controller: passwordContoller),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            //Todo add signin func
                            auth.signIn(
                                password: passwordContoller.text,
                                email: emailContoller.text,
                                context: context);
                          },
                          child: Text("sign In")),
                      RichText(
                          text: TextSpan(
                              text: "Doesnt have an ccount?",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              children: [
                            TextSpan(
                              text: ' Sign Up',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
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
                  RichText(
                      text: TextSpan(
                          text: "Forgot Password? ",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                        TextSpan(
                          text: ' Reset ',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("tapped");
                              // Navigator.pushNamed(
                              //     context, LoginView.routeId);
                            },
                        ),
                      ])),
                ],
              ),
            ),
    );
  }
}
