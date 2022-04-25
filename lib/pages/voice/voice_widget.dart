import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proflu/common/entitys/speaking_status.dart';
import 'package:proflu/common/utils/utils.dart';
import 'package:proflu/common/values/values.dart';
import 'package:proflu/controller/index_controller.dart';

import '../../common/widget/blur_rect_widget.dart';

class VoiceWidget extends StatefulWidget {
  const VoiceWidget({Key? key}) : super(key: key);

  @override
  State<VoiceWidget> createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends State<VoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (ic) {
      switch (ic.status) {
        case SpeakingStatus.userSpeaking:
          return _userSpeakingWidget(ic);
        case SpeakingStatus.aiSpeaking:
          return _aiSpeakingWidget();
        case SpeakingStatus.parseFailed:
          return _errorWidget();
        default:
          return Container();
      }
    });
  }

  Widget _userSpeakingWidget(IndexController ic) {
    if (ic.userWord.isEmpty) {
      return _swiperWidget();
    }
    return _container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ic.userWord,
            style: const TextStyle(fontSize: 16),
          ),
          // const SizedBox(height: 10),
          // Lottie.asset(
          //   'assets/animation/wave2.json',
          //   width: 420.w,
          //   height: 74.w,
          // )
        ],
      ),
      height: 350.w,
    );
  }

  Widget _swiperWidget() {
    List<Widget> children = [
      const Text(
        "试试这样和我说",
        style: TextStyle(fontSize: 18, color: PFc.themeColor),
      ),
    ];
    for (var item in IndexController.to.hints) {
      children.add(
        Text(
          item,
          style: const TextStyle(fontSize: 18),
        ),
      );
    }
    return _container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Text(
          //   "试试这样和我说",
          //   style: TextStyle(
          //     fontSize: 18,
          //     color: PFc.themeColor,
          //   ),
          // ),
          // SizedBox(
          //   height: 80.w,
          //   child: Swiper(
          //     itemBuilder: (c, i) {
          //       return Center(
          //         child: Text(
          //           IndexController.to.hints[i],
          //           style: const TextStyle(fontSize: 16),
          //         ),
          //       );
          //     },
          //     itemCount: IndexController.to.hints.length,
          //     autoplay: true,
          //     scrollDirection: Axis.vertical,
          //   ),
          // ),
          ...children,
          Lottie.asset(
            'assets/animation/wave2.json',
            width: 420.w,
            height: 74.w,
          )
        ],
      ),
      height: 350.w,
    );
  }

  Widget _aiSpeakingWidget() {
    return _container(
      child: Center(
        child: Lottie.asset(
          'assets/animation/wave2.json',
          width: 420.w,
          height: 74.w,
        ),
      ),
      height: 280.w,
    );
  }

  Widget _errorWidget() {
    return _container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "抱歉我有些糊涂,请您再说一遍",
            style: TextStyle(
              fontSize: 32.w,
            ),
          ),
          SizedBox(height: 20.w),
          Lottie.asset(
            'assets/animation/wave2.json',
            width: 420.w,
            height: 74.w,
          ),
        ],
      ),
      height: 280.w,
    );
  }

  Widget _container({
    required Widget child,
    double? height,
  }) {
    return BlurRectWidget(
      child: Container(
        height: height ?? 350.w,
        width: 750.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: child,
      ),
    );
  }
}
