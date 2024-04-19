import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static Future<List<String>> getUserDataFromLocal() async {
    List<String> data = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('phone')) {
      data.add(prefs.getString('phone'));
      data.add(prefs.getString('otp'));
    }
    return data;
  }

  static Future<void> putUserDataToLocal(String phone, String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('phone', phone);
    await prefs.setString('otp', otp);
  }

  static Future<void> removeUserFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('phone');
    await prefs.remove('otp');
  }
}
