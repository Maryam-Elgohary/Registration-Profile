import 'package:flutter/material.dart';
import 'package:profile/customs.dart/buttons.dart';
import 'package:profile/customs.dart/caption_text.dart';
import 'package:profile/customs.dart/route_text.dart';
import 'package:profile/customs.dart/text_field.dart';
import 'package:profile/customs.dart/title_text.dart';
import 'package:profile/screens/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleText(
                text: 'Sign In',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const CaptionText(
                text: 'welcome back. Please sign in to continue',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Image(image: AssetImage("assets/2.png")),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text_Field(
                icon: Icons.email_outlined,
                text: 'Email',
                input: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text_Field(
                icon: Icons.lock_outline,
                text: 'Password',
                input: TextInputType.visiblePassword,
                controller: passController,
                passBool: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const AuthButton(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You are new here? '),
                  RouteText(
                      text: 'Sign Up',
                      funtion: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('email', emailController.text);
                        prefs.setString('pass', passController.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                      })
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
