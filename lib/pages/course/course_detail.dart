import 'package:flutter/material.dart';
import 'package:proflu/common/api/apis.dart';
import 'package:proflu/common/entitys/entitys.dart';

/// 底部弹起的课程详情

// class CourseDetailPage extends StatelessWidget {
//   const CourseDetailPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CourseDetail(),
//     );
//   }
// }

class CourseDetail extends StatefulWidget {
  final product;
  const CourseDetail({Key? key, required this.product}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late PostsData _postsData;
  List _focusData = [];

  int _selectIndex = 0;
  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有课程数据
  _loadAllData() async {
    _postsData = await GqlCourseAPI.indexPageInfo(schema: '', context: context);
    var focusList = _postsData.latestCourse;
    // var focusId = _postsData.latestCourse[1].id;

    setState(() {
      _focusData = focusList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text('详情'),
            //     IconButton(
            //         onPressed: () {
            //           Navigator.of(context).pop();
            //         },
            //         icon: const Icon(Icons.keyboard_arrow_down))
            //   ],
            // ),
            const Divider(
              color: Color(0xffe4e4e4),
            ),
            // 详情标题
            buildDetailTitle(),
            // 详情主体
            buildDetailBody(),
            // 课程介绍
            buildCourseDetail(),
            //课程目录
            buildCatalog(focusData: _focusData),
          ],
        ),
      ),
    );
  }

  Column buildCourseDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Text(
                '课程介绍',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Wrap(
            children: [Text(widget.product.description)],
          ),
        )
      ],
    );
  }

  Container buildDetailTitle() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            widget.product.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Column buildDetailBody() {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          title: Text(
            widget.product.author,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            widget.product.authorTags,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        // // 课程评价
        // ListTile(
        //   leading: const Text(
        //     '课程评价',
        //     style: TextStyle(
        //       color: Colors.grey,
        //     ),
        //   ),
        //   title: Row(
        //     children: const [
        //       Icon(
        //         Icons.star,
        //         color: Colors.orange,
        //       ),
        //       Icon(
        //         Icons.star,
        //         color: Colors.orange,
        //       ),
        //       Icon(
        //         Icons.star,
        //         color: Colors.orange,
        //       ),
        //       Icon(
        //         Icons.star,
        //         color: Colors.orange,
        //       ),
        //       Icon(
        //         Icons.star,
        //         color: Colors.grey,
        //       ),
        //       Text(
        //         '4.0',
        //         style: TextStyle(color: Colors.grey),
        //       )
        //     ],
        //   ),
        // ),
        // // 播放次数
        // ListTile(
        //   leading: const Text(
        //     '播放次数',
        //     style: TextStyle(
        //       color: Colors.grey,
        //     ),
        //   ),
        //   title: Row(
        //     children: const [
        //       Text(
        //         '989次播放',
        //         style: TextStyle(color: Colors.grey),
        //       )
        //     ],
        //   ),
        // ),
        // // 上线时间
        // ListTile(
        //   leading: const Text(
        //     '上线时间',
        //     style: TextStyle(
        //       color: Colors.grey,
        //     ),
        //   ),
        //   title: Row(
        //     children: const [
        //       Text(
        //         '2021年7月9日上线',
        //         style: TextStyle(color: Colors.grey),
        //       )
        //     ],
        //   ),
        // ),
        // 课程标签
        ListTile(
          leading: Text(
            widget.product.classTags,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  '颠覆式创新',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  '公司',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 目录
  Column buildCatalog({required List focusData}) {
    return Column(
      children: [
        const Text(
          '课程目录',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.green,
              fontFamily: 'MyFontStyle',
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text('第${index + 1}节：大公司被颠覆的底层原因\n25分钟'),
              ),
            )
            //     ListView.builder(
            //   itemCount: _focusData.length,
            //   itemBuilder: (context, index) {
            //     if (_focusData.isNotEmpty) {
            //       return InkWell(
            //         onTap: () async {
            //           if (kDebugMode) {
            //             print('到课程详情');
            //           }
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) =>
            //                       CourseIndexPage(product: _focusData[index])));
            //         },
            //         child: Container(
            //           height: 170.h,
            //           decoration: const BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.all(Radius.circular(12.0)),
            //             //border: Border.all(color: Colors.black54),
            //           ),
            //           margin: const EdgeInsets.only(bottom: 10),
            //           child: Stack(
            //             children: <Widget>[
            //               // 课程封面
            //               positionedImage(
            //                   context: context,
            //                   top: 10,
            //                   left: 10,
            //                   height: 160,
            //                   width: 160,
            //                   url:
            //                       'https://scpic2.chinaz.net/Files/pic/pic9/202108/bpic2394$index.jpg'),
            //               // 课程标题
            //               positionedText(
            //                   context: context,
            //                   top: 30,
            //                   left: 190,
            //                   height: 40,
            //                   width: 200,
            //                   text: _focusData[index].title),
            //               // 作者
            //               positionedText(
            //                   context: context,
            //                   top: 55,
            //                   left: 190,
            //                   height: 40,
            //                   width: 200,
            //                   text: _focusData[index].author),
            //               // 课程学习进度
            //               // Positioned(
            //               //   top: 80,
            //               //   left: 130,
            //               //   child: Container(
            //               //     height: 20,
            //               //     width: 80,
            //               //     decoration: BoxDecoration(
            //               //       color: Colors.grey,
            //               //     ),
            //               //     child: Text(
            //               //       '已学2节/共5节',
            //               //       style: TextStyle(
            //               //         fontSize: 12,
            //               //         color: Colors.white,
            //               //       ),
            //               //     ),
            //               //   ),
            //               // ),
            //             ],
            //           ),
            //         ),
            //       );
            //     } else {
            //       return const Text('加载中...');
            //     }
            //   },
            // ),
            ),
      ],
    );
  }
}
