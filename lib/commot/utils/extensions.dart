import 'package:group5_tutorial/commot/core/singleton.dart';
import 'package:flutter/cupertino.dart';

extension Customcontext on BuildContext {

}


double safeAreaHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaVertical =
      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

  double safeAreaBlockVertical =
      (_mediaQueryData.size.height - safeAreaVertical) / 100;
  double actualHeight = height * safeAreaBlockVertical;

  return actualHeight;
}


extension CustomNullableNum on num?{

  Widget get screenHeightInPercentSafeArea {
    var context = SingletonService().key.currentContext!;

    return SizedBox(
      height: safeAreaHeight(context, (this ?? 0.0).toDouble()),
    );
  }

  Widget get height {
    return SizedBox(
      height: (this ?? 0.0).toDouble(),
    );
  }

  Widget get width {
    return SizedBox(
      width: (this ?? 0.0).toDouble(),
    );
  }

  ///Returns boolean
  bool get isZero {
    num value = this ?? 0.0;

    return value == 0.0 || value == 0;
  }

  ///Returns boolean
  bool get isGreaterThanOne {
    num value = this ?? 1.0;

    return value > 1.0 || value > 1;
  }

  ///Returns boolean
  bool get isLesserThanOne {
    num value = this ?? 1.0;

    return value < 1.0 || value < 1;
  }

  ///Returns boolean
  bool get isGreaterThanZero {
    num value = this ?? 0.0;

    return value > 0.0 || value > 0;
  }

  ///Returns boolean
  bool get isGreaterOrEqualToZero {
    num value = this ?? 0.0;

    return value >= 0.0 || value >= 0;
  }

  ///Returns boolean
  bool get isLesserThanZero {
    num value = this ?? 0.0;

    return value < 0.0 || value < 0;
  }
}