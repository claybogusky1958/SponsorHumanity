import 'package:sponsorHumanity/common/color_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String error) {
  Fluttertoast.showToast(
    msg: error,
    timeInSecForIosWeb: 2,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: ColorConstants.kAccentColor,
    textColor: ColorConstants.kwhiteColor,
    fontSize: 14,
  );
}
