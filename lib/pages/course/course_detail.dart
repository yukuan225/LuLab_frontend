import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  // late PostsData _postsData;
  // List _focusData = [];
  //
  // int _selectIndex = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   _loadAllData();
  // }
  //
  // // 读取所有课程数据
  // _loadAllData() async {
  //   _postsData = await GqlCourseAPI.indexPageInfo(schema: '', context: context);
  //   var focusList = _postsData.latestCourse;
  //   // var focusId = _postsData.latestCourse[1].id;
  //
  //   setState(() {
  //     _focusData = focusList;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return buildCourseDetail();
    // return ListView(children: <Widget>[
    //   // const Divider(
    //   //   color: Color(0xffe4e4e4),
    //   // ),
    //   // 详情标题
    //   buildDetailTitle(),
    //   // 详情主体
    //   buildDetailBody(),
    //   // 课程介绍
    //   buildCourseDetail(),
    //   //课程目录
    //   buildCatalog(focusData: _focusData),
    // ]);
  }

//课程简介
  ListView buildCourseDetail() {
    return ListView(
      children: [
        const Divider(
          color: Color(0xffe4e4e4),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                '课程名称:' + widget.product.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'MyFontStyle',
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          title: Text(
            '作者：' + widget.product.author,
            style: const TextStyle(
                fontFamily: 'MyFontStyle',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            widget.product.authorTags,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
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
        ),
        // const Text(
        //   '课程目录',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //       color: Colors.green,
        //       fontFamily: 'MyFontStyle',
        //       fontSize: 20,
        //       fontWeight: FontWeight.w500),
        // ),
        // Container(
        //   height: 800.h,
        //   width: 500.w,
        //   child: ListView.builder(
        //     itemCount: _focusData.length,
        //     itemBuilder: (context, index) {
        //       if (_focusData.isNotEmpty) {
        //         return InkWell(
        //           onTap: () async {
        //             if (kDebugMode) {
        //               print('到课程详情');
        //             }
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) =>
        //                         CourseIndexPage(product: _focusData[index])));
        //           },
        //           child: Container(
        //             height: 150.h,
        //             decoration: const BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.all(Radius.circular(12.0)),
        //               //border: Border.all(color: Colors.black54),
        //             ),
        //             margin: const EdgeInsets.all(5.0),
        //             child: Stack(
        //               children: <Widget>[
        //                 // 课程封面
        //                 positionedImage(
        //                     context: context,
        //                     top: 10,
        //                     left: 10,
        //                     height: 160,
        //                     width: 160,
        //                     url:
        //                         'https://scpic2.chinaz.net/Files/pic/pic9/202108/bpic2394$index.jpg'),
        //                 // 课程标题
        //                 positionedText(
        //                     context: context,
        //                     top: 30,
        //                     left: 190,
        //                     height: 40,
        //                     width: 200,
        //                     text: _focusData[index].title),
        //                 // 作者
        //                 positionedText(
        //                     context: context,
        //                     top: 55,
        //                     left: 190,
        //                     height: 40,
        //                     width: 200,
        //                     text: _focusData[index].author),
        //               ],
        //             ),
        //           ),
        //         );
        //       } else {
        //         return const Text('加载中...');
        //       }
        //     },
        //   ),
        // ),
      ],
    );
  }

  // Container buildDetailTitle() {
  //   return Container(
  //     margin: const EdgeInsets.only(left: 20),
  //     child: Row(
  //       children: [
  //         Text(
  //           '课程名称:' + widget.product.title,
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(
  //               fontFamily: 'MyFontStyle',
  //               fontSize: 25,
  //               fontWeight: FontWeight.w600),
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // Column buildDetailBody() {
  //   return Column(
  //     children: [
  //       ListTile(
  //         leading: const CircleAvatar(
  //           backgroundImage: AssetImage('assets/images/logo.png'),
  //         ),
  //         title: Text(
  //           '作者：' + widget.product.author,
  //           style: const TextStyle(
  //               fontFamily: 'MyFontStyle',
  //               fontSize: 16,
  //               fontWeight: FontWeight.w600),
  //         ),
  //         subtitle: Text(
  //           widget.product.authorTags,
  //           style: const TextStyle(fontSize: 16, color: Colors.grey),
  //         ),
  //       ),
  //       // // 课程评价
  //       // ListTile(
  //       //   leading: const Text(
  //       //     '课程评价',
  //       //     style: TextStyle(
  //       //       color: Colors.grey,
  //       //     ),
  //       //   ),
  //       //   title: Row(
  //       //     children: const [
  //       //       Icon(
  //       //         Icons.star,
  //       //         color: Colors.orange,
  //       //       ),
  //       //       Icon(
  //       //         Icons.star,
  //       //         color: Colors.orange,
  //       //       ),
  //       //       Icon(
  //       //         Icons.star,
  //       //         color: Colors.orange,
  //       //       ),
  //       //       Icon(
  //       //         Icons.star,
  //       //         color: Colors.orange,
  //       //       ),
  //       //       Icon(
  //       //         Icons.star,
  //       //         color: Colors.grey,
  //       //       ),
  //       //       Text(
  //       //         '4.0',
  //       //         style: TextStyle(color: Colors.grey),
  //       //       )
  //       //     ],
  //       //   ),
  //       // ),
  //       // // 播放次数
  //       // ListTile(
  //       //   leading: const Text(
  //       //     '播放次数',
  //       //     style: TextStyle(
  //       //       color: Colors.grey,
  //       //     ),
  //       //   ),
  //       //   title: Row(
  //       //     children: const [
  //       //       Text(
  //       //         '989次播放',
  //       //         style: TextStyle(color: Colors.grey),
  //       //       )
  //       //     ],
  //       //   ),
  //       // ),
  //       // // 上线时间
  //       // ListTile(
  //       //   leading: const Text(
  //       //     '上线时间',
  //       //     style: TextStyle(
  //       //       color: Colors.grey,
  //       //     ),
  //       //   ),
  //       //   title: Row(
  //       //     children: const [
  //       //       Text(
  //       //         '2021年7月9日上线',
  //       //         style: TextStyle(color: Colors.grey),
  //       //       )
  //       //     ],
  //       //   ),
  //       // ),
  //       // 课程标签
  //       ListTile(
  //         leading: Text(
  //           widget.product.classTags,
  //           style: const TextStyle(
  //             color: Colors.grey,
  //           ),
  //         ),
  //         title: Row(
  //           children: [
  //             Container(
  //               margin: const EdgeInsets.symmetric(horizontal: 5),
  //               child: const Text(
  //                 '颠覆式创新',
  //                 style: TextStyle(color: Colors.grey),
  //               ),
  //             ),
  //             Container(
  //               margin: const EdgeInsets.symmetric(horizontal: 5),
  //               child: const Text(
  //                 '公司',
  //                 style: TextStyle(color: Colors.grey),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

}
