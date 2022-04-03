//import 'package:flutter/material.dart';

import 'package:date_format/date_format.dart';

class TimeChange {
  static client(int stamp, String value) {
    var time = DateTime.fromMillisecondsSinceEpoch(stamp);
    if (value == "y") {
      return formatDate(time, [yyyy]);
    } else if (value == "m") {
      return formatDate(time, [mm]);
    } else if (value == "d") {
      return formatDate(time, [dd]);
    } else if (value == "h") {
      return formatDate(time, [hh]);
    } else if (value == "m") {
      return formatDate(time, [nn]);
    } else if (value == "ymd") {
      return formatDate(time, [yyyy, '年', mm, '月', dd, '日']);
    } else if (value == "md") {
      return formatDate(time, [mm, '月', dd, '日']);
    }
  }
}
