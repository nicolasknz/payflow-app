import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflow/app_widget.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';

void main() {
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Material(
            child: Text(
              "Não foi possível inicializar o Firebase!",
              textDirection: TextDirection.ltr,
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
