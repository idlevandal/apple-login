import 'package:flutter/material.dart';
import 'package:the_apple_sign_in/apple_id_credential.dart';

class AfterLoginPage extends StatelessWidget {
  final AppleIdCredential? credential;

  AfterLoginPage({required this.credential});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('You are logged in! ${credential?.fullName}', style: TextStyle(fontSize: 50),),
      ),
    );
  }
}
