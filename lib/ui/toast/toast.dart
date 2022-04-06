//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// late FToast fToast;
//
// @override
// void initState() {
//   super.initState();
//   fToast = FToast();
//   fToast.init(context);
// }
//
// _showToast(var msg){
//   Widget toast = Container(
//     padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8.0),
//     decoration: BoxDecoration(
//         gradient: LinearGradient(begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: [
//               Color(0xFF0EB49E),Color(0xFF93C73F)
//             ])
//     ),
//     child: Text(msg,style: TextStyle(color: Colors.white),),
//   );
//
//
//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.BOTTOM,
//     toastDuration: Duration(seconds: 1),
//   );
// }