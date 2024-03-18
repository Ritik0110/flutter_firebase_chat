import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/utilities/custom_fonts.dart';
import 'package:flutter_firebase_chat/utilities/extension.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  @override
  void dispose() {
    _phoneNumberController.dispose();
    _btnController.stop();
    super.dispose();
  }
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
              Text("Firebase Chat App", style: CustomFonts.medium24),
              20.sizedBoxHeight,
              Text("Add your phone number will send you a code to verify",
                  textAlign: TextAlign.center, style: CustomFonts.regular16),
              20.sizedBoxHeight,
              TextFormField(
                controller: _phoneNumberController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  counterText:
                      "", // it uses when we limit the length of input and don't want to show it in UI
                  hintText: "Enter your phone number",
                  prefixIcon: const CountryCodePicker(
                    onChanged: print,
                    initialSelection: 'IN',
                    favorite: ['+91', 'IN'],
                    showFlag: true,
                    flagWidth: 25,
                    padding: EdgeInsets.zero,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
