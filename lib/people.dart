import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  final agecontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      namecontroller.text = documentSnapshot['name'];
      agecontroller.text = documentSnapshot['age'].toString();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  controller: namecontroller,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: agecontroller,
                  decoration: const InputDecoration(
                    labelText: "Age",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String name = namecontroller.text;
                      final String age = agecontroller.text.toString();
                      if (age != null||name != null) {
                        await students
                            .doc(documentSnapshot!.id)
                            .update({"name": name, "age": age});
                        namecontroller.text = '';
                        agecontroller.text = '';
                        ScaffoldMessenger.of(context).showSnackBar(
                         const  SnackBar(content: Text("updated member details",
                         style: TextStyle(color: Colors.red),
                         ),
                         duration: Duration(seconds: 2),
                         ),
                        );
                      }
                    },
                    child: const Text("Update")),
              ],
            ),
          );
        });
  }

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      namecontroller.text = documentSnapshot['name'];
      agecontroller.text = documentSnapshot['age'].toString();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  controller: namecontroller,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: agecontroller,
                  decoration: const InputDecoration(
                    labelText: "Age",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String name = namecontroller.text;
                      final String age = agecontroller.text.toString();
                      if (age != null) {
                        await students.add({"name": name, "age": age});
                        namecontroller.text = '';
                        agecontroller.text = '';
                        ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(content: Text("Successfully added a member",
                          style: TextStyle(color: Colors.red),
                          ),
                          duration:Duration(seconds: 2) ,)
                        );
                      }
                    },
                    child: const Text("Add")),
              ],
            ),
          );
        });
  }

  Future<void> _delete(String studentId) async {
    await students.doc(studentId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Succesfully deleted a memebr',
        style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _create();
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          "Member details",
          style: GoogleFonts.roboto(
              color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: students.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Card(
                child: ListTile(
                  title: Text(document['name']),
                  subtitle: Text(document['age'].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          _update(document);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          _delete(document.id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
