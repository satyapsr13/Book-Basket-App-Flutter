// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:nhsbpmonitor/Constants/colors.dart';
// import 'package:nhsbpmonitor/Constants/locations.dart';
// // import 'package:nhsbpmonitor/Presentation/Screens/signals_screen.dart';

// class GradientScreen extends StatefulWidget {
//   Widget body;

//   GradientScreen({
//     Key? key,
//     required this.body,
//   }) : super(key: key);

//   @override
//   State<GradientScreen> createState() => _GradientScreenState();
// }

// class _GradientScreenState extends State<GradientScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaquery = MediaQuery.of(context).size;
//     return Scaffold(
//       // backgroundColor:Color(0xff0072BC),
//       // resizeToAvoidBottomInset: false,
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Stack(
//               // fit: StackFit.expand,
//               clipBehavior: Clip.none,
//               children: [
//                 Image.asset(
//                   AssetImages.backgroundLadyImage,
//                   height: mediaquery.height,
//                   width: mediaquery.width,
//                 ),
//                 Container(
//                   width: mediaquery.width,
//                   constraints: BoxConstraints(minHeight: mediaquery.height),
//                   decoration: BoxDecoration(gradient: linearGradient()),
//                   child: widget.body,
//                 ),
//                 // widget.body,
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AppHeader extends StatelessWidget {
//   const AppHeader({
//     Key? key,
//     required this.mediaquery,
//   }) : super(key: key);

//   final Size mediaquery;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Container(
//         height: 50,
//         width: mediaquery.width * 0.95,
//         decoration: BoxDecoration(
//           color: Color(0xffDBDCDE),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               onPressed: null,
//               icon: SvgPicture.asset(
//                 AssetIcons.aA,
//                 height: 21,
//                 width: 20,
//                 color: Colors.black,
//               ),
//             ),
//             TextFormField(
//               readOnly: true,
//               textAlign: TextAlign.center,
//               initialValue: "Medic.com",
//               decoration: InputDecoration(
//                 constraints: BoxConstraints(
//                   // maxHeight: 85,
//                   maxWidth: mediaquery.width * 0.6,
//                 ),
//                 filled: true,
//                 border: InputBorder.none,
//                 fillColor: Color(0xffDBDCDE),
//                 // prefix:
//               ),
//             ),
//             IconButton(
//               onPressed: null,
//               icon: const Icon(
//                 Icons.refresh,
//                 size: 20,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nhsbpmonitor/Constants/colors.dart';
import 'package:nhsbpmonitor/Constants/locations.dart';
// import 'package:nhsbpmonitor/Presentation/Screens/signals_screen.dart';

class GradientScreen extends StatefulWidget {
  Widget body;

  GradientScreen({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  State<GradientScreen> createState() => _GradientScreenState();
}

class _GradientScreenState extends State<GradientScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Container(
      width: mediaquery.width,
      height:  mediaquery.height,
      // constraints: BoxConstraints(minHeight: mediaquery.height),
      decoration: BoxDecoration(gradient: linearGradient()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    // fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: mediaquery.height-20,
                        width: mediaquery.width,
                        child: Image.asset(
                          AssetImages.backgroundLadyImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Container(
                      //   width: mediaquery.width,
                      //   constraints: BoxConstraints(minHeight: mediaquery.height),
                      //   decoration: BoxDecoration(gradient: linearGradient()),
                      //   child: widget.body,
                      // ),
                      widget.body,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key? key,
    required this.mediaquery,
  }) : super(key: key);

  final Size mediaquery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 50,
        width: mediaquery.width * 0.95,
        decoration: BoxDecoration(
          color: Color(0xffDBDCDE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                AssetIcons.aA,
                height: 21,
                width: 20,
                color: Colors.black,
              ),
            ),
            TextFormField(
              readOnly: true,
              textAlign: TextAlign.center,
              initialValue: "Medic.com",
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  // maxHeight: 85,
                  maxWidth: mediaquery.width * 0.6,
                ),
                filled: true,
                border: InputBorder.none,
                fillColor: Color(0xffDBDCDE),
                // prefix:
              ),
            ),
            IconButton(
              onPressed: null,
              icon: const Icon(
                Icons.refresh,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
