import 'package:flutter/material.dart';
import 'package:profile/constants.dart';
import 'package:profile/customs.dart/buttons.dart';
import 'package:profile/customs.dart/caption_text.dart';
import 'package:profile/customs.dart/route_text.dart';
import 'package:profile/customs.dart/text_field.dart';
import 'package:profile/customs.dart/title_text.dart';
import 'package:profile/screens/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleText(
                  text: 'Sign Up',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const CaptionText(
                  text: 'welcome!. Please sign up to continue',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Image(image: AssetImage("assets/1.png")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text_Field(
                  icon: Icons.person,
                  text: 'User Name',
                  input: TextInputType.name,
                  controller: nameController,
                ),
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
                  passBool: true,
                  controller: passController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Constants.primaryColor),
                        minimumSize: MaterialStatePropertyAll(Size(360, 50))),
                    onPressed: () {
                      if (nameController == null ||
                          emailController == null ||
                          passController == null) {
                        AlertDialog(
                          title: Text("Alert!!!"),
                          content: Text("Try to fill all fields!"),
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Have an account? '),
                    RouteText(
                        text: 'Sign In',
                        funtion: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('email', emailController.text);
                          prefs.setString('pass', passController.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
