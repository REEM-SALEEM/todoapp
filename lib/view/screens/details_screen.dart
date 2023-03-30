// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ScreenDetails extends StatefulWidget {
//   ScreenDetails(this.note, {super.key});
//   QueryDocumentSnapshot note;
//   @override
//   State<ScreenDetails> createState() => SscreenDetailsState();
// }

// class SscreenDetailsState extends State<ScreenDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 59, 57, 57),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back_ios_new))),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 59, 57, 57),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: IconButton(
//                     onPressed: () {}, icon: const Icon(Icons.edit_note))),
//           ),
//         ],
//         backgroundColor: const Color.fromARGB(255, 33, 33, 33),
//       ),
//       backgroundColor: const Color.fromARGB(255, 33, 33, 33),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.note['note_title'],
//               style: const TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               widget.note['creation_date'],
//               style: const TextStyle(fontSize: 16,color: Colors.white),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               widget.note['note_content'],
//               style: const TextStyle(fontSize: 20,color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
