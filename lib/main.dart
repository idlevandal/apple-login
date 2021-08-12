import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

import 'after_login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send),
          onPressed: () => FirebaseFirestore.instance
              .collection('test')
              .add({'timestamp': Timestamp.fromDate(DateTime.now())})
      ),
      appBar: AppBar(
        title: Text('Apple sign in..'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('🍏', style: TextStyle(fontSize: 100.0),),
          ),
          ElevatedButton(
              onPressed: () {
                logIn(context);
              },
              child: Text('apple sign in'),
          )
        ],
      )
    );
  }

  void logIn(BuildContext context) async {
    final AuthorizationResult result = await TheAppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
    print(result.status);

    switch (result.status) {
      case AuthorizationStatus.authorized:

      // Store user ID
        await FlutterSecureStorage()
            .write(key: "userId", value: result.credential?.user);

        // Navigate to secret page (shhh!)
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => AfterLoginPage(credential: result.credential)));
        break;

      case AuthorizationStatus.error:
        print("Sign in failed: ${result.error?.localizedDescription}");
        print('Sign in failed');
        break;

      case AuthorizationStatus.cancelled:
        print('User cancelled');
        break;
    }
  }
}
