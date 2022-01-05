import 'package:flutter/material.dart';

class FeatsPage extends StatefulWidget {
  const FeatsPage({Key? key}) : super(key: key);

  @override
  _FeatsPageState createState() => _FeatsPageState();
}

class _FeatsPageState extends State<FeatsPage> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕高度
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var widgetwidth = screenwidth - 10 * 2;
    return Container(
      height: screenheight,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
          //背景颜色在主题处统一设定
          //color: Colors.black12,
          ),
      child: ListView.builder(
        itemBuilder: (contxt, index) {
          return Row(
            children: [
              //SizedBox(height: 150),
              Container(
                height: 120,
                width: widgetwidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  //border: Border.all(color: Colors.black54),
                ),
                margin: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      left: 10,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                              'https://www.itying.com/images/flutter/hot${index + 1}.jpg'),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 10,
                      left: 130,
                      child: SizedBox(
                        height: 20,
                        child: Text(
                          '张三-三哥餐饮CEO',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 35,
                      left: 130,
                      child: SizedBox(
                        height: 40,
                        width: 200,
                        child: Text(
                          '新东方厨师学校毕业，冷链运输专家。',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 130,
                      child: Container(
                        height: 20,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: const Text(
                          '213次观看',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
