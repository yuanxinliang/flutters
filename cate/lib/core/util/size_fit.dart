import 'dart:ui';

class XLSizeFit {
  static double physicalWidth;
  static double physicalHeight;
  static double dpr;
  static double screenWidth;
  static double screenHeight;
  static double statusHeight;
  static double bottomHeight;
  static double rpx;
  static double px;

  static void initial({double standardSize = 750}) {
    // 屏幕分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    dpr = window.devicePixelRatio;
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;
    statusHeight = window.padding.top;
    bottomHeight = window.padding.bottom;
    rpx = screenWidth / standardSize;
    px = rpx * 2;
  }
}

extension DoubleFit on double {
  double get px {
    return XLSizeFit.px * this;
  }
  double get rpx {
    return XLSizeFit.rpx * this;
  }
}

extension IntFit on int {
  double get px {
    return XLSizeFit.px * this;
  }
  double get rpx {
    return XLSizeFit.rpx * this;
  }
}