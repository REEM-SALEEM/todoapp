import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/view/screens/note_editor.dart';
import 'package:todoapp/view/screens/note_reader.dart';
import 'package:todoapp/view/widgets/note_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        appBar: AppBar(
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 57, 57),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search))),
            ),
          ],
          title: const Text(
            'Notes',
            style:
                TextStyle(fontSize: 29, letterSpacing: 1, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("notes")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      //checking the connection state, if we still load the data we can display a progress
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          children: snapshot.data!.docs
                              .map((note) => noteCard(() {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          NoteReaderScreen(note),
                                    ));
                                  }, note))
                              .toList(),
                        );
                      }
                      return const Text('no notes');
                    },
                  ),
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NoteEditorScreen(),
            ));
          },
          backgroundColor: const Color.fromARGB(255, 77, 76, 76),
          label: const Text('Add Note'),
          icon: const Icon(Icons.add),
        ));
  }
}
