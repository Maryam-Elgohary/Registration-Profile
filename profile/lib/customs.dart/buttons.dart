import 'package:flutter/material.dart';
import 'package:profile/constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Constants.primaryColor)),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('navigation');
          },
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 20, color: Colors.black),
          )),
    );
  }
}
