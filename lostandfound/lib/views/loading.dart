import 'package:flutter/material.dart';
import 'package:lostandfound/core/appTheme.dart';
import 'package:lostandfound/core/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/0_Splash Screen@2x.png',
          fit: BoxFit.cover,
        ),
        Container(
          color: Vx.gray100,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(AppTheme.appColor),
            ),
          ),
        ).centered().expand(),
      ],
    );
  }
}
