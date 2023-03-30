import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Wrap(children: [
            Text(
              widget.doc["note_title"],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ]),
          const SizedBox(height: 5),
          Text(
            widget.doc["note_content"],
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Expanded(
              child: SizedBox(
            height: 20,
          )),
          Text(
            widget.doc["creation_date"],
            style: const TextStyle(color: Color.fromARGB(255, 93, 90, 90)),
          )
        ]),
      ),
    );
  }
}
