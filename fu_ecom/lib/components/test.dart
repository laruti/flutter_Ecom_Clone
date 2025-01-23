// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// class DriverList extends StatelessWidget {@overrideWidget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Driver List")),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('DriverList').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           final drivers = snapshot.data?.docs ?? [];
//           return ListView.builder(
//             itemCount: drivers.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(drivers[index]['name']),
//               );
//             },
//           );
//         },
//       ),
//     );
//  }
// }