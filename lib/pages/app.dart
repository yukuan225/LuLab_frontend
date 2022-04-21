import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/pages/voice/voice_view.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'course/course_page.dart';
import 'home/home_page.dart';
import 'source/Infor_page.dart';
import 'users/users_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  //late DateTime _lastPressedAt; //上次点击时间

  final List<Widget> _pageList = [
    const HomePage(),
    const CoursePage(),
    const VoiceView(),
    const InformationPage(),
    const UsersPage(),
  ];

  @override
  void initState() {
    super.initState();
    _handleSignIn();
    NetState.network();
  }

  LatestRecordElement? _recordElement;

  getNotice() {
    int now = DateTime.now().millisecondsSinceEpoch;
    GqlHomeAPI.ordersInfo(
            variables: LatestRecordRequest(
                authorId: Global.profile.id!, limit: 0, skip: 0),
            context: context)
        .then((LatestRecord value) {
      for (var item in value.latestRecord) {
        int diff = item.onlineTime - now;
        if (diff >= 0 && diff <= 600000) {
          setState(() {
            _recordElement = item;
          });

          break;
        }
      }
    }).catchError(print);
  }

  // 执行登录操作
  _handleSignIn() async {
    var user = Storage.getJson(storageUserProfileKey);
    user.then(
      (guide) async {
        var user1 = Data.fromJson(json.decode(guide!));
        if (kDebugMode) {
          print(user1.name);
        }
        try {
          UserLogin userProfile = await GqlUserAPI.login(
            context: context,
            variables: Loginrequest(
              name: user1.name ?? "",
              password: user1.password ?? "",
            ),
          );
          Global.saveProfile(userProfile.data);
          getNotice();
        } catch (e) {
          if (kDebugMode) {
            print("===========登录报错内容===============");
            print(e);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return UseWillPopScope(
      child: Scaffold(
        // 语音识别按钮
        floatingActionButton: const VoiceView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                controller: _pageController,
                children: _pageList,
              ),
            ),
            if (_recordElement != null)
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 28.w,
                right: 28.w,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        /// TODO 跳转到直播详情页
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => LiveDetail(product: item),
                        //   ),
                        // );
                      },
                      child: Container(
                        padding: EdgeInsets.all(24.w),
                        width: 722.w,
                        height: 178.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                PFtext.text1(
                                    text: "直播预约提醒",
                                    fontSize: 28.w,
                                    color: PFc.textSecondary),
                                Spacer(),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      _recordElement = null;
                                    });
                                  },
                                  child: Container(
                                      width: 40.w,
                                      height: 40.w,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffDDDDDD),
                                          borderRadius:
                                              BorderRadius.circular(20.w)),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.close_rounded,
                                        color: Colors.white,
                                        size: 24.w,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(height: 8.w),
                            PFtext.text2(
                                text: "陆向谦实验室     开播了", fontSize: 28.w),
                            // Spacer(),
                            PFtext.text2(
                                text: _recordElement!.title,
                                fontSize: 24.w,
                                color: PFc.textSecondary),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            // 去掉水波纹效果
            splashColor: Colors.transparent,
            // 去掉长按效果
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
              _pageController.jumpToPage(index);
            },
            // 选中图标主题
            selectedIconTheme: const IconThemeData(
              color: PFc.themeColor,
              size: 28,
              opacity: 1.0,
            ),
            //选中字体颜色
            selectedLabelStyle: const TextStyle(color: PFc.themeColor),
            selectedItemColor: PFc.themeColor,
            //未选中图标主题
            unselectedIconTheme: const IconThemeData(
              color: Colors.black,
              size: 26,
              opacity: 1,
            ),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconHomeDefault),
                  activeIcon: Icon(MyIcon.navIconHomeSelected),
                  label: ('首页'),
                  //去掉长按提示语
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconCourseDefault),
                  activeIcon: Icon(MyIcon.navIconCourseSelected),
                  label: ('课程'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sms), label: (''), tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconFindDefault),
                  activeIcon: Icon(MyIcon.navIconFindSelected),
                  label: ('资讯'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.navIconUserDefault),
                  activeIcon: Icon(MyIcon.navIconUserSelected),
                  label: ('我的'),
                  tooltip: '')
            ],
          ),
        ),
      ),
    );
  }
}
