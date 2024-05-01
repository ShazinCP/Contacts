import 'package:flutter/material.dart';

class PhoneProvider extends ChangeNotifier{
  TextEditingController phoneController = TextEditingController();

  void setPhone(String value) {
    phoneController.text = value;
    notifyListeners();
  }
  
    String? otpCode;

    void updateOtp(String value){
      otpCode = value;
      notifyListeners();
    }
}