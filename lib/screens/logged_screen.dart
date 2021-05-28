import 'package:fire_base_google_sign_in/services/google_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedScreen extends StatefulWidget {
  @override
  _LoggedScreenState createState() => _LoggedScreenState();
}

class _LoggedScreenState extends State<LoggedScreen> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Welcome',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () async => await GoogleSignService().googleLogOut(),
            icon: Icon(Icons.logout),
            label: Text(
              'Logout',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : ${user!.displayName!.split(' ')[0]}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  'Surename : ${user!.displayName!.split(' ')[1]}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  'E-mail : ${user!.email}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
