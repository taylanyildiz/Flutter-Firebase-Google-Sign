import 'package:fire_base_google_sign_in/services/google_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoogleSignService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Google Sign',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(title: 'Flutter Firebase Google Sign'),
      ),
    );
  }
}
