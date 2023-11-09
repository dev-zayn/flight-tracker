import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'theme/colors.dart';

void showSnackMsg(BuildContext context, msg, {Color color = kcGreen}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(msg),
    ),
  );
}

void showToastFlutter(msg,
    {ToastGravity gravity = ToastGravity.TOP, Color color = kcGreen}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    backgroundColor: color,
    textColor: kcWhite,
    fontSize: 16.0,
  );
}
