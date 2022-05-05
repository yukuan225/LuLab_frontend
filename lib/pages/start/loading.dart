import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proflu/pages/app.dart';
import 'package:proflu/pages/sign_in/sign_in.dart';
import 'package:proflu/pages/start/first_guide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<int> readData() async {
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getInt('isFirstOpen');
    return result ?? 0;
  }

  Future<int> readData2() async {
    var prefs = await SharedPreferences.getInstance();
    var result2 = prefs.getInt('isFirstSign');

    return result2 ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        'assets/images/StartPage.png',
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  void countDown() {
    var _duration = const Duration(seconds: 3);

    if (kDebugMode) {
      print("陆向谦程序启动....");
    }
    //Storage.getInt("Key_Int");
    Future<int> result = readData();
    Future<int> result2 = readData2();
    result.then(
      (guide) {
        if (kDebugMode) {
          print(guide);
        }
        //判断是否是第一次启动app
        if (guide == 0) {
          Future.delayed(_duration, _firstguide);
        } else {
          // Future.delayed(_duration, _app);
          result2.then((guide) {
            if (kDebugMode) {
              print(guide);
            }
            //判断是否是第一次登录app
            if (guide == 0) {
              Future.delayed(_duration, _firstsign);
            } else {
              Future.delayed(_duration, _app);
            }
          });
        }
      },
    );
  }

  void _firstguide() {
    Get.offAll(const FirstGuidePage());
  }

  void _firstsign() {
    Get.offAll(const SignInPage());
  }

  void _app() {
    Get.offAll(const App());
  }
}
