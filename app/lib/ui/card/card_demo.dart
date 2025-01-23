// import 'package:card/majestic_card.dart';
// import 'package:flutter/material.dart';

// class CardDemo extends StatelessWidget {
//   const CardDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: MajesticCard(
//           width: 300,
//           height: 300,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const MajesticCardHeader(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MajesticCardTitle(
//                       child: Text(
//                         "Create Project",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     MajesticCardSubtitle(
//                         child: Text(
//                       "Deploy your new project in one-click",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w300,
//                         color: Colors.black54,
//                         fontSize: 14,
//                       ),
//                     )),
//                   ],
//                 ),
//               ),
//               MajesticCardContent(
//                 child: Container(
//                   child: const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Name'),
//                       MajesticCard(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Name of your project',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       Text('Framework'),
//                       MajesticCard(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Name of your project',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               MajesticCardFooter(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(onPressed: () {}, child: const Text('Cancel')),
//                     TextButton(onPressed: () {}, child: const Text('Deploy')),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MajesticCardHeader extends StatelessWidget {
//   final Widget child;

//   const MajesticCardHeader({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
//       child: child,
//     );
//   }
// }

// class MajesticCardTitle extends StatelessWidget {
//   final Widget child;

//   const MajesticCardTitle({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: child,
//     );
//   }
// }

// class MajesticCardSubtitle extends StatelessWidget {
//   final Widget child;

//   const MajesticCardSubtitle({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: child,
//     );
//   }
// }

// class MajesticCardContent extends StatelessWidget {
//   final Widget child;

//   const MajesticCardContent({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 16, right: 16),
//       margin: const EdgeInsets.symmetric(vertical: 12),
//       child: child,
//     );
//   }
// }

// class MajesticCardFooter extends StatelessWidget {
//   final Widget child;

//   const MajesticCardFooter({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//       child: child,
//     );
//   }
// }
