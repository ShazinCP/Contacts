import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/constants/sizedboxes.dart';
import 'package:totalx_machine_task/controller/phone_provider.dart';
import 'package:totalx_machine_task/helper/colors.dart';
import 'package:totalx_machine_task/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<PhoneProvider>(
            builder: (context, provider, child) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 35,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(20.0),
                        decoration: const BoxDecoration(),
                        child: Image.asset(
                          "assets/login_image.png",
                        ),
                      ),
                      cHeight20,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 12),
                          Text(
                            "Enter Phone Number",
                            style: TextStyle(
                              fontSize: 14,
                              color: cBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      cHeight20,
                      TextFormField(
                        controller: provider.phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          provider.setPhone(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter phone number",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: cGreyColorShade600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: cBlackColor12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: cBlackColor12),
                          ),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "+91",
                            ),
                          ),
                        ),
                      ),
                      cHeight10,
                      const Row(
                        children: [
                          Text("By Continuing, I agree to TotalX's"),
                          Text(
                            " Terms and condition",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(" &"),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "privacy policy",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      cHeight20,
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ButtonWidget(
                          text: "Get OTP",
                          onpressed: () {
                            // sendPhoneNumber(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // void sendPhoneNumber(BuildContext context) {
  //   final value = Provider.of<AuthProvider>(context, listen: false);
  //   final data = Provider.of<PhoneProvider>(context, listen: false);
  //   String phoneNumber = data.phoneController.text.trim();
  //   value.signInWithPhone(
  //       context, "+${data.selectedCountry.phoneCode}$phoneNumber");
  // }
}
