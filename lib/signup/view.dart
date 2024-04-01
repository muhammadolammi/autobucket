import 'package:autobucket/components/appbar.dart';
import 'package:autobucket/components/input.dart';
import 'package:autobucket/models/user.dart';
import 'package:autobucket/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
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
                child: Text("sign up"))
          ],
        ),
      ),
    );
  }
}
