import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .8,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              width: 2.0,
            )),
        color: Colors.red[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/google-symbol.png',
                width: 30.0,
              ),
              Text(
                'Sing Up with Google',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
