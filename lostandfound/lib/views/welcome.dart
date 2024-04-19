import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/appTheme.dart';
import 'package:lostandfound/views/login.dart';
import 'package:lostandfound/views/signup.dart';
import 'package:velocity_x/velocity_x.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/0_Splash Screen@2x.png',
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/Logo@3x.png",
                height: 180,
              ).centered().expand(),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  children: [
                    CustomButton(text: '  Login with Phone', icon: Icons.call)
                        .onTap(() {
                      Get.to(() => LoginPage());
                    }),
                    36.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 2,
                          color: Colors.black54,
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                        8.widthBox,
                        Text(
                          "OR",
                          style: AppTheme.body,
                        ),
                        8.widthBox,
                        Container(
                          height: 2,
                          color: Colors.black54,
                          width: MediaQuery.of(context).size.width / 4,
                        )
                      ],
                    ),
                    36.heightBox,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/Google@2x.png',
                            height: 54,
                          ),
                          Image.asset(
                            'assets/Facebook@2x.png',
                            height: 54,
                          ),
                          Image.asset(
                            'assets/Instagram@2x.png',
                            height: 54,
                          ),
                        ]),
                    36.heightBox,
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: AppTheme.body),
                      TextSpan(
                          text: "SignUp",
                          style: AppTheme.body
                              .copyWith(fontWeight: FontWeight.w900))
                    ])).onTap(() {
                      Get.to(() => SignupPage());
                    }),
                    36.heightBox,
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.text,
    this.icon,
    Key key,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppTheme.appColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  (icon == null)
                      ? WidgetSpan(child: SizedBox())
                      : WidgetSpan(
                          child: Icon(
                          icon,
                          color: Colors.white,
                        )),
                  TextSpan(
                      text: text,
                      style: AppTheme.body.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700))
                ])),
          ),
        ));
  }
}
