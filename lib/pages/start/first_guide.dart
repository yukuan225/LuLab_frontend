import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proflu/common/global/global.dart';

import '../../common/utils/utils.dart';
import '../sign_in/sign_in.dart';

class FirstGuidePage extends StatefulWidget {
  const FirstGuidePage({Key? key}) : super(key: key);

  @override
  _FirstGuidePageState createState() => _FirstGuidePageState();
}

class _FirstGuidePageState extends State<FirstGuidePage> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // 背景图
        buildFirstGuideBackGround(1.sw, 1.sh),
        // 小圆点
        Positioned(
          left: 0.w,
          right: 0.w,
          bottom: 0.1.sh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buidIndefot(_currIndex == 0),
              buidIndefot(_currIndex == 1),
              buidIndefot(_currIndex == 2),
            ],
          ),
        ),
        // 去首页
        Positioned(
          left: 0.w,
          right: 0.w,
          bottom: 0.2.sh,
          child: buildGoHome(),
        ),
      ],
    );
  }

  Row buildGoHome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          height: _currIndex == 2 ? 70.h : 0,
          width: _currIndex == 2 ? 300.w : 0,
          duration: const Duration(milliseconds: 0),
          child: ElevatedButton(
            child: const Text('立即体验'),
            onPressed: () {
              Storage.setInt('isFirstOpen', Global.isFirstOpen);
              Get.offAll(const SignInPage());
            } // 去首页路由
            ,
          ),
        )
      ],
    );
  }

  // 引导页背景图
  Positioned buildFirstGuideBackGround(double width, double height) {
    return Positioned.fill(
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            _currIndex = value;
          });
        },
        children: [
          Image.asset(
            'assets/images/GuidePage1.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/GuidePage2.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/GuidePage3.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          // Image.network(
          //   'https://images.leotian.cn/blog/2019-04-29-102020.jpg',
          //   width: width,
          //   height: height,
          //   fit: BoxFit.fill,
        ],
      ),
    );
  }

  // 小圆点
  Widget buidIndefot(bool isSelected) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(15),
      height: 18,
      width: isSelected ? 25 : 18,
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }
}
