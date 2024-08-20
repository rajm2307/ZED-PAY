import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:zedpay/core/styles/border_radius.style.dart';
// import 'package:zedpay/core/styles/color.style.dart';
// import 'package:zedpay/core/utils/texts/sub_body.text.dart';

class PrimaryButton extends ConsumerWidget {
  final Widget? textWidget;
  final Color? color;
  final Color? disableColor;
  final Color? fontColor;
  final Function onTap;
  final bool isEnabled;
  final String? disableToastMsg;

  const PrimaryButton({
    super.key,
    required this.textWidget,
    required this.onTap,
    this.color = Colors.red,
    this.disableColor = Colors.grey,
    this.fontColor = Colors.white,
    this.isEnabled = true,
    this.disableToastMsg,
  });

  void _showToast(BuildContext context, String? msg) {
    msg ??= "button disable";
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // height: 60,
      elevation: 0,
      minWidth: MediaQuery.of(context).size.width,
      color: isEnabled ? color : disableColor,
      onPressed: isEnabled
          ? () => onTap()
          : () {
              _showToast(context, disableToastMsg);
            },

      child: textWidget,
    );
  }
}



// Container(
  // decoration: BoxDecoration(
    // color: Colors.blue,
    // borderRadius: BorderRadius.only(
      // topLeft: Radius.circular(10),
      // topRight: Radius.circular(10),
    // ),
    // border: Border(
      // top: BorderSide(color: Colors.red, width: 2), // Example top border
      // left: BorderSide(color: Colors.red, width: 2), // Example left border
      // right: BorderSide(color: Colors.red, width: 2), // Example right border
      // bottom: BorderSide.none, // No bottom border
    // ),
  // ),
  // child: Padding(
    // padding: EdgeInsets.all(16.0),
    // child: Text('Your content here', style: TextStyle(color: Colors.white)),
  // ),
// )
