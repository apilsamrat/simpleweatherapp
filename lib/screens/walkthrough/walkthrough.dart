// import 'package:flutter/material.dart';
// import 'package:simpleweatherapp/utilities/colors.dart';
// import 'package:simpleweatherapp/styles/buttonstyle.dart';
// import 'package:simpleweatherapp/styles/fontstyle.dart';

// class AppWalkThrough extends StatefulWidget {
//   const AppWalkThrough({super.key});

//   @override
//   State<AppWalkThrough> createState() => AppWalkThroughState();
// }

// class AppWalkThroughState extends State<AppWalkThrough> {
//   PageController pageController = PageController(initialPage: 0);
//   final int totalpages = 4;
//   int currentPage = 0;

//   @override
//   void initState() {
//     initial();
//     super.initState();
//   }

//   initial() {
//     pageController.addListener(() {
//       setState(() {
//         currentPage = pageController.page!.toInt();
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Flexible(
//             child: PageView(
//               controller: pageController,
//               children: [
//                 ReuseableWidget(
//                   color: bgColor,
//                   child: Text(
//                     "img",
//                     style: headingStyle.copyWith(
//                         fontSize: 128, fontWeight: FontWeight.w400),
//                   ),
//                 ),
//                 ReuseableWidget(
//                   color: bgColor,
//                   child: Image.asset(
//                     "assets/images/icon_transparent.png",
//                     width: 150,
//                   ),
//                 ),
//                 ReuseableWidget(
//                   color: bgColor,
//                   child: Image.asset(
//                     "assets/images/icon_transparent.png",
//                     width: 150,
//                   ),
//                 ),
//                 ReuseableWidget(
//                   color: bgColor,
//                   child: Image.asset(
//                     "assets/images/icon_transparent.png",
//                     width: 150,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "What is Lorem Ipsum?",
//                       style: headingStyle,
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                       style: bodytextStyle,
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 23),
//                   child: MyPageIndicator(
//                     controller: pageController,
//                     initialPage: 0,
//                     totalPages: totalpages,
//                     inActiveColor: const Color(0XFF787486),
//                     activeColor: primaryColor,
//                   ),
//                 ),
//                 SizedBox(
//                     height: 48,
//                     width: 358,
//                     child: TextButton(
//                         onPressed: () {
//                           if (pageController.page!.toInt() != totalpages - 1) {
//                             setState(() {
//                               pageController.animateToPage(
//                                   pageController.page!.toInt() + 1,
//                                   duration: const Duration(milliseconds: 500),
//                                   curve: Curves.linear);
//                             });
//                           } else {
//                             navigate();
//                           }
//                         },
//                         style: primaryButtonStyle,
//                         child: Text(
//                           (currentPage != totalpages - 1) ? "Next" : "Done",
//                         ))),
//                 const SizedBox(height: 24),
//                 TextButton(
//                     onPressed: () {
//                       navigate();
//                     },
//                     style: primaryTransparentButtonStyle,
//                     child: const Text("Skip")),
//                 const SizedBox(height: 12),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void navigate() {
//     Navigator.pushNamedAndRemoveUntil(context, "/signin", (route) => false);
//   }
// }

// class ReuseableWidget extends StatefulWidget {
//   final Color color;
//   final Widget child;
//   const ReuseableWidget({
//     super.key,
//     required this.color,
//     required this.child,
//   });

//   @override
//   State<ReuseableWidget> createState() => _ReuseableWidgetState();
// }

// class _ReuseableWidgetState extends State<ReuseableWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(43, 48, 43, 0),
//       alignment: Alignment.center,
//       color: widget.color,
//       child: Container(
//         alignment: Alignment.center,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(24), topRight: Radius.circular(24)),
//           color: Color(0XFFD5DAE1),
//         ),
//         height: double.infinity,
//         width: double.infinity,
//         child: widget.child,
//       ),
//     );
//   }
// }

// class MyPageIndicator extends StatefulWidget {
//   final PageController controller;
//   final int initialPage;
//   final int totalPages;
//   final Color inActiveColor;
//   final Color activeColor;
//   const MyPageIndicator(
//       {super.key,
//       required this.controller,
//       required this.initialPage,
//       required this.totalPages,
//       required this.inActiveColor,
//       required this.activeColor});

//   @override
//   State<MyPageIndicator> createState() => _MyPageIndicatorState();
// }

// class _MyPageIndicatorState extends State<MyPageIndicator> {
//   int currentPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(widget.totalPages, (index) {
//         widget.controller.addListener(
//           () {
//             setState(() {
//               currentPage = widget.controller.page!.toInt();
//             });
//           },
//         );
//         return AnimatedContainer(
//           curve: Curves.easeIn,
//           duration: const Duration(milliseconds: 500),
//           width: index == currentPage ? 20 : 10,
//           height: 10,
//           decoration: BoxDecoration(
//               color: index == currentPage
//                   ? widget.activeColor
//                   : widget.inActiveColor,
//               borderRadius: const BorderRadius.all(Radius.circular(20))),
//           margin: const EdgeInsets.all(4),
//         );
//       }),
//     );
//   }
// }
