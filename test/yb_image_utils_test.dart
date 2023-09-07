import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yb_image_utils/yb_image_utils.dart';

void main() {
  test('adds one to input values', () {
    var a1 = "";
    var a2 = "";
    print(YbImageUtils.isEmpty(a1));
    print(YbImageUtils.isEmptyString(a2));
    Widget widget = YbImageUtils.ybGetNetImg(30, 30, "", null);
    print(widget.runtimeType);
  });


}
