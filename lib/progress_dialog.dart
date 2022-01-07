
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:progress_dialog/progress_dialog.dart';

// class ProgressAlert extends StatefulWidget {
//   const ProgressAlert({Key key}) : super(key: key);

//   @override
//   _ProgressAlertState createState() => _ProgressAlertState();
// }

// class _ProgressAlertState extends State<ProgressAlert> {
//   double prcentage = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     final pr = ProgressDialog(context, type: ProgressDialogType.Download);
//     pr.style(
//         message: "Loading...",
//         borderRadius: 10.0,
//         backgroundColor: Colors.black45,
//         elevation: 10.0,
//         progress: 0.0,
//         maxProgress: 100.0,
//         progressTextStyle: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.white24,
//           fontSize: 13.0,
//         ),
//         messageTextStyle: const TextStyle(
//           fontWeight: FontWeight.w400,
//           color: Colors.white24,
//           fontSize: 19.0,
//         ),
        
//         progressWidget: Container(
//           padding: const EdgeInsets.all(8.0),
//           child: Lottie.asset("assets/files/transparent.json"),
//         ));
    
//      updateProgress() async {
//       await pr.show();
//       await Future.delayed(const Duration(seconds: 2));
//       prcentage = 30.0;
//       pr.update(progress: prcentage, message: "Please wait..");
//       await Future.delayed(const Duration(seconds: 2));
//       prcentage = 60.0;
//       pr.update(progress: prcentage, message: "almost there..");
//       await Future.delayed(const Duration(seconds: 3));
//       prcentage = 95.0;
//       pr.update(progress: prcentage, message: "Completing...");
//       await Future.delayed(const Duration(seconds: 1));
//       pr.hide();
//     }
//   }
// }
