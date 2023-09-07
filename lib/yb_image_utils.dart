library yb_image_utils;

import 'package:flutter/material.dart';

class YbImageUtils{

  /// 圆角边框图片
  static Widget ybCornerImg(double size, String imgStr,
      {double radius = 6,
        Color bgColor = Colors.white,
        BoxFit fit = BoxFit.scaleDown}) {
    bool isNetImg = true;

    if (isEmpty(imgStr)) {
      imgStr = "";
    }
    if (size == null) {
      size = 40;
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
            width: 0.5,
            color: isNetImg ? Color(0xfff1f1f1) : Color(0xFFFFFF)),
        borderRadius: BorderRadius.circular(radius),
        color: bgColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Builder(
          builder: (ctx) {
            return imgStr.length == 0
                ? Container(width: size, height: size)
                : Container(
              child: Builder(
                builder: (ctx) {
                  bool isNetImage = imgStr.startsWith("http");
                  if (isNetImage) {
                    return Image.network(
                      imgStr,
                      width: size,
                      height: size,
                      fit: fit,
                      errorBuilder: (BuildContext context,
                          Object error,
                          StackTrace stackTrace){
                        return Container();
                      },
                    );
                  } else {
                    return Image.asset(
                      imgStr,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
  /// 获取网络图片 并添加替代图
  static Widget ybGetNetImg(
      double width, double height, String imgStr, String placeholder,
      {double radius = 6,
        Color bgColor = Colors.white,
        placeholderBoxFit = BoxFit.cover,
        BoxFit fit = BoxFit.scaleDown}) {
    if (isEmpty(imgStr)) {
      imgStr = "";
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.transparent,
      ),
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Builder(
            builder: (ctx) {
              return isEmptyString(placeholder)
                  ? Container()
                  : Center(
                child: Image.asset(
                  placeholder,
                  // color: bgColor,
                  width: width,
                  height: height,
                  fit: placeholderBoxFit,
                ),
              );
            },
          ),
          Builder(
            builder: (ctx) {
              return isEmptyString(imgStr)
                  ? Container()
                  : Container(
                width: width,
                height: height,
                color: bgColor,
                child: Center(
                  child: Image.network(
                    imgStr,
                    fit: fit,
                    errorBuilder: (BuildContext context,
                        Object error,
                        StackTrace stackTrace){
                      return isEmptyString(placeholder)
                          ? Container()
                          : Center(
                        child: Image.asset(
                          placeholder,
                          // color: bgColor,
                          width: width,
                          height: height,
                          fit: placeholderBoxFit,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  static bool isEmpty(Object object) {
    if (object == null) return true;
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is Iterable && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }
  static bool isEmptyString(String str) {
    return str == null || str.isEmpty;
  }
  
}
