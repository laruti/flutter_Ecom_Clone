import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fu_ecom/firebase_options.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:fu_ecom/pages/Cart_page.dart';
import 'package:fu_ecom/pages/auth_page.dart';
import 'package:fu_ecom/thems/them_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: ChangeNotifierProvider(
        create: (_) => GoodsProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const Auth(),
            // home: DriverListScreen(),

      routes: {
        '/cart_page': (context) => const CartPage(),
        // 'login_page': (context) => const LoginPage(onTap: () {}),
      },
    );
  }
// }
// class DriverListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
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
//                 subtitle: Text(drivers[index]['password'] ?? 'No phone number available'),
//                 trailing: Text(drivers[index]['phone']),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
}