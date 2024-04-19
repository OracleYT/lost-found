import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lostandfound/core/constants.dart';

import '../models/userData.dart';

class AuthService extends GetxController {
  AuthService({UserData user}) {
    if (user != null) userData.value = user;
  }
  var userData = UserData().obs;

  Future<String> login(
    String phone,
    String otp,
  ) async {
    UserData user = UserData(phone: phone, otp: otp, type: '');
    await Constants.putUserDataToLocal(phone, otp);
    userData.value = user;
    return 'success';
  }

  // getToken(String authToken) async {
  //   var token = "";
  //   try {
  //     token = await FirebaseMessaging.instance.getToken();
  //     //[TO:DO] call api to store token to backend.
  //     print(token);
  //     await ApiEndpoints.sendFCM(authToken, token);
  //   } on Exception catch (e) {
  //     // TODO
  //     print(e.toString());
  //   }
  // }

  Future<String> signUp(String phone, String otp, String type) async {
    // await Constants.putUserDataToLocal(phone, otp);

    UserData user = UserData(phone: phone, otp: otp, type: '');
    await Constants.putUserDataToLocal(phone, otp);
    userData.value = user;
    return 'success';
  }
}
