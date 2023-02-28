import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({Key? key}) : super(key: key);

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  CollectionReference student = FirebaseFirestore.instance.collection('Student');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List of Registration",
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.brown),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: student.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;

              return Container(
                child: Column(
                  children: [
                    Text('Name: ${data['name']}'),
                    Text('Age: ${data['age']}'),
                    Text('Email: ${data['email']}'),
                    Text('Password: ${data['password']}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
