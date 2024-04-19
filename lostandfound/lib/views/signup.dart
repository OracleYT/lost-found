import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lostandfound/main.dart';
import 'package:lostandfound/views/login.dart';
import 'package:lostandfound/views/lostItem.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/appTheme.dart';
import '../core/authService.dart';
import 'welcome.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key key}) : super(key: key);

  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.put(AuthService(), permanent: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset(
                    "assets/Sign in bg@2x.png",
                    fit: BoxFit.fitWidth,
                    // height: 180,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.heightBox,
                        Image.asset(
                          'assets/Back@3x.png',
                          height: 30,
                        ).onTap(() {
                          Get.back();
                        }),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome",
                                    style: AppTheme.heading
                                        .copyWith(color: Colors.white),
                                  ),
                                  12.heightBox,
                                  Text(
                                    "Enter Valid Mobile Number",
                                    style: AppTheme.body
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ).centered().expand(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile number',
                      style:
                          AppTheme.body.copyWith(color: Colors.blueGrey[400]),
                    ),
                    6.heightBox,
                    IntlPhoneField(
                      controller: phone,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        // labelStyle:
                        //     AppTheme.body.copyWith(fontWeight: FontWeight.w900),
                        hintStyle: AppTheme.body
                            .copyWith(color: Colors.grey.withOpacity(0.5)),
                        // border: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.white)
                        //     // borderSide: Bordr
                        //     ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    6.heightBox,
                    Text(
                      'Register For?',
                      style:
                          AppTheme.body.copyWith(color: Colors.blueGrey[400]),
                    ),
                    6.heightBox,
                    DropdownButton(
                      isExpanded: true,

                      items: [
                        DropdownMenuItem(
                            child: Container(
                          height: 40,
                          child: Text(
                            'Operator',
                            style: AppTheme.body,
                          ),
                        ))
                      ],
                      // controller: otp,
                      // decoration: InputDecoration(
                      //   //   border: OutlineInputBorder(),
                      //   // labelText: 'OTP',
                      //   hintText: 'Enter OTP',
                      //   hintStyle: AppTheme.body
                      //       .copyWith(color: Colors.grey.withOpacity(0.5)),
                      // ),
                    ),
                    12.heightBox,
                    TextField(
                      controller: otp,
                      decoration: InputDecoration(
                        //   border: OutlineInputBorder(),
                        // labelText: 'OTP',
                        hintText: 'Enter OTP',
                        hintStyle: AppTheme.body
                            .copyWith(color: Colors.grey.withOpacity(0.5)),
                      ),
                    ),
                    24.heightBox,
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Resend OTP",
                        textAlign: TextAlign.end,
                        style: AppTheme.body.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppTheme.appColor),
                      ),
                    ),
                    24.heightBox,
                    CustomButton(
                      text: 'SIGN UP',
                    ).onTap(() async {
                      if (phone.text.length > 9 && otp.text.length > 5) {
                        String res =
                            await authService.signUp(phone.text, otp.text, '');
                        if (res == "success") {
                          Fluttertoast.showToast(msg: "Login Successful");
                          await Future.delayed(100.milliseconds);

                          Get.offAll(
                            () => LostItemPage(),
                          );
                        } else {
                          Fluttertoast.showToast(msg: "Something went wrong.");
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Phone must be > 10 & OTP > 6');
                      }
                    }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: "Back to ", style: AppTheme.body),
                TextSpan(
                    text: "Login",
                    style: AppTheme.body.copyWith(fontWeight: FontWeight.w900))
              ])).onTap(() {
                Get.to(() => LoginPage());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
