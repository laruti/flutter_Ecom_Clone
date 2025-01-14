import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fu_ecom/firebase_options.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:fu_ecom/pages/auth_page.dart';
import 'package:fu_ecom/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => GoodsProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth(),
    );
  }
}
