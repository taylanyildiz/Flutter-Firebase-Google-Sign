import 'package:fire_base_google_sign_in/services/google_service.dart';
import 'package:fire_base_google_sign_in/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleSignScreen extends StatefulWidget {
  GoogleSignScreen({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;
  @override
  _GoogleSignScreenState createState() => _GoogleSignScreenState();
}

class _GoogleSignScreenState extends State<GoogleSignScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/google-symbol.png'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey There,\nWelcome Back',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Login to your account to contiune',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 100.0),
            GoogleButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignService>(context, listen: false);
                provider.googleSign();
              },
            ),
          ],
        ),
      ),
    );
  }
}
