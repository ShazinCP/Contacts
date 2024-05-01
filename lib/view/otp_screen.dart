import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/constants/sizedboxes.dart';
import 'package:totalx_machine_task/controller/auth_provider.dart';
import 'package:totalx_machine_task/controller/phone_provider.dart';
import 'package:totalx_machine_task/helper/colors.dart';
import 'package:totalx_machine_task/widgets/button.dart';
import 'package:totalx_machine_task/widgets/snackbar.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 30),
                    child: Consumer<PhoneProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                "assets/otp_image.png",
                              ),
                            ),
                            cHeight20,
                            const Row(
                              children: [
                                Text(
                                  "OTP Verification",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Enter the verification code we just sent to your number +91********${provider.phoneController.text.length >= 2 ? provider.phoneController.text.substring(provider.phoneController.text.length - 2) : ''}",
                                ),
                              ],
                            ),
                            cHeight20,
                            Pinput(
                              length: 6,
                              showCursor: true,
                              defaultPinTheme: PinTheme(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: cRedColor,
                                ),
                              ),
                              onCompleted: (value) {
                                provider.updateOtp(value);
                              },
                            ),
                            cHeight15,
                            const Text(
                              "59 Sec",
                              style: TextStyle(color: cRedColor),
                            ),
                            cHeight20,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dont get OTP? ",
                                ),
                                Text(
                                  "Resent",
                                  style: TextStyle(
                                    color: cBlueColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: ButtonWidget(
                                text: "Verify",
                                onpressed: () {
                                  if (provider.otpCode != null) {
                                  } else {
                                    showSnackBar(context, "Enter 6-Digit code");
                                  }
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  // verify otp
  // void verifyOtp(BuildContext context, String userOtp) {
  //   final data = Provider.of<AuthProvider>(context, listen: false);
  //   data.verifyOtp(
  //     context: context,
  //     verificationId: widget.verificationId,
  //     userOtp: userOtp,
  //     onSuccess: () {
  //       // checking whether user exists in the db
  //       data.checkExistingUser().then(
  //         (value) async {
  //           if (value == true) {
  //             // user exists in our app
  //             data.getDataFromFirestore().then(
  //                   (value) => data.saveUserDataToSP().then(
  //                         (value) => data.setSignIn().then(
  //                               (value) => Navigator.pushAndRemoveUntil(
  //                                   context,
  //                                   MaterialPageRoute(
  //                                     builder: (context) => const HomeScreen(),
  //                                   ),
  //                                   (route) => false),
  //                             ),
  //                       ),
  //                 );
  //           } else {
  //             // new user
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => const UserInformationScreen()),
  //                 (route) => false);
  //           }
  //         },
  //       );
  //     },
  //   );
  // }
}
