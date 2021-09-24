import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CourseRecomPage"),
      ),
      body: CourseRecomPage(),
    );
  }
}

class CourseRecomPage extends StatefulWidget {
  CourseRecomPage({Key? key}) : super(key: key);

  @override
  _CourseRecomPageState createState() => _CourseRecomPageState();
}

class _CourseRecomPageState extends State<CourseRecomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // 课程列表
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc3c3c3),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset('images/1.jpg'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc3c3c3)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                title: Text("颠覆式创新"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("陆向谦  实验室创始人"), Text("已学2节/共5节")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}