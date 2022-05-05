import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:proflu/common/utils/utils.dart';
import 'package:proflu/common/values/values.dart';
import 'package:textfield_search/textfield_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/entitys/entitys.dart';
import '../search/search2.dart';

//选择城市地区联动索引页
//https://raw.githubusercontent.com/xiedong11/flutter_app/master/static/phoneCode.json

class PhoneCountryCodePage extends StatefulWidget {
  const PhoneCountryCodePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<PhoneCountryCodePage> {
  List<String> letters = [];
  List<String> cities = [];
  late Phoneresponse fdata;
  late List<Datum> data = [];

  double _top = 100;

  bool _float = false;

  final ScrollController _scrollController = ScrollController();

  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPhoneCodeDataList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getPhoneCodeDataList() async {
    String jsonString =
        await rootBundle.loadString("assets/static/phoneCode.json");

    fdata = Phoneresponse.fromJson(json.decode(jsonString));

    if (fdata.code == 200) {
      setState(() {
        data = fdata.data;
        for (int i = 0; i < data.length; i++) {
          letters.add(data[i].name.toUpperCase());
        }

        for (int i = 0; i < data.length; i++) {
          for (int j = 0; j < data[i].listData.length; j++) {
            cities.add(data[i].listData[j].name);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Padding(
          //   padding: const EdgeInsets.only(top: 2, bottom: 2, left: 16),
          //   child: Container(
          //     height: 35,
          //     width: MediaQuery.of(context).size.width - 64,
          //     decoration: BoxDecoration(
          //         color: const Color.fromRGBO(230, 230, 230, 1.0),
          //         borderRadius: BorderRadius.circular(20)),
          //     child: TextFieldSearch(
          //       initialList: cities,
          //       label: '搜索',
          //       controller: myController,
          //     ),
          //   ),
          // ),
          ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            controller: _scrollController,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PhoneCodeIndexName(data[index].name.toUpperCase()),
                  ListView.separated(
                    itemCount: data[index].listData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index2) {
                      return GestureDetector(
                        child: SizedBox(
                          height: 46,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: PFspace.screenMargin),
                            child: Row(
                              children: <Widget>[
                                Text(data[index].listData[index2].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff434343))),
                                Text(
                                  "+${data[index].listData[index2].code}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Color(0xff434343)),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.back(result: data[index].listData[index2].code);
                          Get.snackbar(
                              "国家区号", data[index].listData[index2].code);
                          // Navigator.of(context)
                          //     .pop(data[index].listData[index2].code);
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                          color: Colors.grey, indent: PFspace.screenMargin);
                    },
                  ),
                ],
              );
            },
          ),
          Align(
            alignment: const FractionalOffset(1.0, 0.5),
            child: GestureDetector(
              onVerticalDragStart: (details) {
                if (kDebugMode) {
                  print("onVerticalDragStart---${details.localPosition.dy}");
                }
                setState(() {
                  if (details.localPosition.dy > 100 &&
                      details.localPosition.dy < 100 + letters.length * 16) {
                    _top = details.localPosition.dy;
                    var a = (_top - 100) ~/ 16;
                    var height = a * 45.0;
                    for (int i = 0; i < a; i++) {
                      height += data[i].listData.length * 46.0;
                    }
                    _scrollController.jumpTo(height);
                  }
                  _float = true;
                });
              },
              onVerticalDragCancel: () {
                if (kDebugMode) {
                  print("onVerticalDragCancel");
                }
              },
              onVerticalDragDown: (details) {
                if (kDebugMode) {
                  print("onVerticalDragDown---${details.localPosition.dy}");
                }
                setState(() {
                  if (details.localPosition.dy > 100 &&
                      details.localPosition.dy < 100 + letters.length * 16) {
                    _top = details.localPosition.dy;
                    var a = (_top - 100) ~/ 16;
                    var height = a * 45.0;
                    for (int i = 0; i < a; i++) {
                      height += data[i].listData.length * 46.0;
                    }
                    _scrollController.jumpTo(height);
                  }
                  _float = false;
                });
              },
              onVerticalDragEnd: (details) {
                if (kDebugMode) {
                  print(
                      "onVerticalDragEnd---${details.velocity}---${details.primaryVelocity}");
                }
                setState(() {
                  _float = false;
                });
              },
              onVerticalDragUpdate: (details) {
                if (kDebugMode) {
                  print("onVerticalDragUpdate----${details.localPosition.dy}");
                }
                setState(() {
                  if (details.localPosition.dy > 100 &&
                      details.localPosition.dy < 100 + letters.length * 16) {
                    _top = details.localPosition.dy;
                    var a = (_top - 100) ~/ 16;
                    var height = a * 45.0;
                    for (int i = 0; i < a; i++) {
                      height += data[i].listData.length * 46.0;
                    }
                    _scrollController.jumpTo(height);
                  }
                });
              },
              child: SizedBox(
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: letters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: SizedBox(
                          height: 16,
                          child: Text(
                            letters[index],
                            style: index == ((_top - 100) ~/ 16)
                                ? const TextStyle(
                                    color: PFc.themeColor, fontSize: 20)
                                : const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 50,
              top: _top,
              child: _float == true
                  ? Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26.w),
                        color: PFc.themeColor,
                      ),
                      child: Center(
                        child: Text(letters.isEmpty
                            ? ""
                            : letters[((_top - 100) ~/ 16)]),
                      ),
                    )
                  : const Text("")),
        ],
      ),
    );
  }
}

class PhoneCodeIndexName extends StatelessWidget {
  final String indexName;
  const PhoneCodeIndexName(this.indexName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      color: PFc.backgroundBlack10,
      child: Padding(
        child: Text(indexName,
            style: const TextStyle(fontSize: 20, color: Color(0xff434343))),
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: PFspace.screenMargin),
      ),
    );
  }
}
