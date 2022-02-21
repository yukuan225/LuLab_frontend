import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';
import 'course_index.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late MainCourseRequest _postsData;
  List _focusData = [];

  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有课程数据
  _loadAllData() async {
    _postsData = await MainCourseAPI.maincourse(schema: '', context: context);
    var focusList = _postsData.data.latestMainCourse;

    setState(() {
      _focusData = focusList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //由主题统一配色，不在这里重新设定颜色
        //backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: InkWell(
          //onTap是点击事件回调
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          child: Container(
            height: 30.0,
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                //改变搜索外框颜色
                //border: Border.all(color: Colors.black),
                color: const Color.fromRGBO(230, 230, 230, 0.8),
                borderRadius: BorderRadius.circular(15)),
            child: Row(children: const <Widget>[
              Icon(
                Icons.search,
                color: (Color.fromRGBO(89, 89, 89, 1)),
              ),
              Text(
                "开始搜索",
                //textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(89, 89, 89, 1),
                  fontSize: 15,
                ),
              )
            ]),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (kDebugMode) {
                  print("跳转到观看历史");
                }
                Navigator.pushNamed(context, '/history');
              },
              icon: const Icon(
                Icons.history,
                color: Color.fromRGBO(117, 117, 117, 1),
              ))
        ],
      ),
      body: Row(
        children: <Widget>[
          SizedBox(
            width: 100.w,
            height: double.infinity,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (kDebugMode) {
                            print("点击了课程目录");
                          }
                          _selectIndex = index;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        child: const Text("推荐", textAlign: TextAlign.center),
                        color:
                            _selectIndex == index ? Colors.blue : Colors.white,
                      ),
                    ),
                    const Divider(
                      height: 5,
                      endIndent: 10,
                    )
                  ],
                );
              },
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 12),
                child: ListView.builder(
                  itemCount: _focusData.length,
                  itemBuilder: (context, index) {
                    if (_focusData.isNotEmpty) {
                      return InkWell(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CourseIndexPage(
                                      product: _focusData[index])));
                        },
                        child: Container(
                          height: 170.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            //border: Border.all(color: Colors.black54),
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Stack(
                            children: <Widget>[
                              // 课程封面
                              positionedImage(
                                  context: context,
                                  top: 10,
                                  left: 10,
                                  height: 160,
                                  width: 160,
                                  url:
                                      'https://images8.alphacoders.com/498/thumb-1920-498307.jpg'),
                              // 课程标题
                              positionedText(
                                  context: context,
                                  top: 30,
                                  left: 190,
                                  height: 40,
                                  width: 200,
                                  text: _focusData[index].title),
                              // 作者
                              positionedText(
                                  context: context,
                                  top: 55,
                                  left: 190,
                                  height: 40,
                                  width: 200,
                                  text: _focusData[index].author),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Text('加载中...');
                    }
                  },
                ),
              ))
        ],
      ),
    );
  }
}
