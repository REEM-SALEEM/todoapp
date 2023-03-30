import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppStyle.cardsColor[2]),
      child: Padding(
        padding: const EdgeInsets.all(08.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Wrap(children: [
            Text(
              doc["note_title"],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ]),
          const SizedBox(height: 5),
          Text(
            doc["note_content"],
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Expanded(
              child: SizedBox(
            height: 20,
          )),
          Text(
            doc["creation_date"],
            style: const TextStyle(color: Color.fromARGB(255, 93, 90, 90)),
          )
        ]),
      ),
    ),
  );
}
