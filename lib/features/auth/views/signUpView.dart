import 'package:autobucket/components/appbar.dart';
import 'package:autobucket/components/customfield.dart';
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
    final auth = ref.watch(authProvider);
    final emailContoller = TextEditingController();
    final genderContoller = TextEditingController();

    final nameContoller = TextEditingController();

    final passwordContoller = TextEditingController();

    void signUpFunc(UserModel user) {
      auth.signUp(user);
    }

    return Scaffold(
      appBar: myAppBar,
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormField(labelText: "email", controller: emailContoller),
            CustomFormField(
                labelText: "password", controller: passwordContoller),
            CustomFormField(labelText: "name", controller: nameContoller),
            CustomFormField(labelText: "gender", controller: genderContoller),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      signUpFunc(UserModel(
                          name: nameContoller.text,
                          email: emailContoller.text,
                          password: passwordContoller.text,
                          isWorker: false,
                          isAdmin: false,
                          profilePic: "",
                          gender: genderContoller.text));
                    },
                    child: Text("sign up")),
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: [
                      TextSpan(
                        text: ' Sign In',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("tapped");
                            Navigator.pushNamed(context, SignInView.route);
                          },
                      ),
                    ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}
