import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lostandfound/core/constants.dart';

import '../core/authService.dart';
import '../views/lostItem.dart';
import '../views/welcome.dart';

class AuthController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();
  getAccountDetails() async {
    List<String> data = await Constants.getUserDataFromLocal();

    if (data.isEmpty) {
      Get.offAll(() => LandingPage());
    } else {
      //new login
      performNewLogin(data);
    }
  }

  performNewLogin(data) async {
    AuthService authService = Get.put(AuthService(), permanent: true);
    // String baseUrl = await Utils.getBaseUrlFromLocal();
    String res = await authService.login(data[0], data[1]);
    if (res == "success") {
      Fluttertoast.showToast(msg: "Login Successful");
      await Future.delayed(100.milliseconds);

      Get.offAll(
        () => LostItemPage(),
      );
    } else {
      Fluttertoast.showToast(msg: "Something went wrong.");
    }
  }
}
