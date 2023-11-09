import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Responsive {
  final BuildContext mainContext;
  Responsive({required this.mainContext});
  // width and height of the screen
  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double screenHeight(context) => MediaQuery.of(context).size.height;

  double get width => MediaQuery.of(mainContext).size.width;
  double get height => MediaQuery.of(mainContext).size.height;

  // get check screen size for each type of platform
  static bool isDesktopSize(context) {
    return kIsWeb ? screenWidth(context) > 800 : screenWidth(context) > 1024;
  }

  static bool isMobileTabletSize(context) {
    return kIsWeb ? screenWidth(context) <= 800 : screenWidth(context) <= 1024;
  }

  static bool isMobileSize(context) => screenWidth(context) <= 450;
  static bool isTabletSize(context) {
    return kIsWeb
        ? screenWidth(context) > 450 && screenWidth(context) <= 800
        : screenWidth(context) > 450 && screenWidth(context) <= 1024;
  }

  // check is rtl
  static bool isRTL(context) => Directionality.of(context) == TextDirection.rtl;

  static p1h(context) => screenHeight(context) * 0.0027;
  static p2h(context) => screenHeight(context) * 0.0054;
  static p3h(context) => screenHeight(context) * 0.0081;
  static p4h(context) => screenHeight(context) * 0.0108;
  static p5h(context) => screenHeight(context) * 0.013;
  static p6h(context) => screenHeight(context) * 0.016;
  static p7h(context) => screenHeight(context) * 0.019;
  static p8h(context) => screenHeight(context) * 0.0216;
  static p9h(context) => screenHeight(context) * 0.0243;
  static p10h(context) => screenHeight(context) * 0.027;
  static p15h(context) => screenHeight(context) * 0.04;
  static p20h(context) => screenHeight(context) * 0.054;
  static p25h(context) => screenHeight(context) * 0.067;
  static p30h(context) => screenHeight(context) * 0.081;
  static p35h(context) => screenHeight(context) * 0.094;
  static p40h(context) => screenHeight(context) * 0.108;

  static p1w(context) => screenWidth(context) * 0.0027;
  static p2w(context) => screenWidth(context) * 0.0054;
  static p3w(context) => screenWidth(context) * 0.0081;
  static p4w(context) => screenWidth(context) * 0.0108;
  static p5w(context) => screenWidth(context) * 0.013;
  static p6w(context) => screenWidth(context) * 0.016;
  static p7w(context) => screenWidth(context) * 0.019;
  static p8w(context) => screenWidth(context) * 0.0216;
  static p9w(context) => screenWidth(context) * 0.0243;
  static p10w(context) => screenWidth(context) * 0.027;
  static p15w(context) => screenWidth(context) * 0.04;
  static p20w(context) => screenWidth(context) * 0.054;
  static p25w(context) => screenWidth(context) * 0.067;
  static p30w(context) => screenWidth(context) * 0.081;
  static p35w(context) => screenWidth(context) * 0.094;
  static p40w(context) => screenWidth(context) * 0.108;
  static sp(context, fontSize) => fontSize * ((screenWidth(context) / 3) / 100);

  bool get isWebSize {
    return kIsWeb ? width > 800 : width > 1024;
  }

  // double get p1h => height * 0.0027;
  // double get p2h => height * 0.0054;
  // double get p3h => height * 0.0081;
  // double get p4h => height * 0.0108;
  // double get p5h => height * 0.013;
  // double get p6h => height * 0.016;
  // double get p7h => height * 0.019;
  // double get p8h => height * 0.0216;
  // double get p9h => height * 0.0243;
  // double get p10h => height * 0.027;
  // double get p15h => height * 0.04;
  // double get p20h => height * 0.054;
  // double get p25h => height * 0.067;
  // double get p30h => height * 0.081;
  // double get p35h => height * 0.094;
  // double get p40h => height * 0.108;
  //
  // double get p1w => width * 0.0027;
  // double get p2w => width * 0.0054;
  // double get p3w => width * 0.0081;
  // double get p4w => width * 0.0108;
  // double get p5w => width * 0.013;
  // double get p6w => width * 0.016;
  // double get p7w => width * 0.019;
  // double get p8w => width * 0.0216;
  // double get p9w => width * 0.0243;
  // double get p10w => width * 0.027;
  // double get p15w => width * 0.04;
  // double get p20w => width * 0.054;
  // double get p25w => width * 0.067;
  // double get p30w => width * 0.081;
  // double get p35w => width * 0.094;
  // double get p40w => width * 0.108;
  // double sp(fontSize) => fontSize * ((width / 3) / 100);
}

extension MediaQueryExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
