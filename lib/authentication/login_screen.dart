import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/utilities/custom_fonts.dart';
import 'package:flutter_firebase_chat/utilities/extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              250.sizedBoxHeight,
              //Lottie.asset('assets/lottie/chat.json'),
              Text("Firebase Chat App",
                   style: CustomFonts.medium24),
              20.sizedBoxHeight,
              Text("Add your phone number will send you a code to verify",
                  textAlign: TextAlign.center,
                  style: CustomFonts.regular16),
              20.sizedBoxHeight,
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
