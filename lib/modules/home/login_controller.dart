import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();
  // todo: verificar
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      // final response = await _googleSignIn.signIn();

      // final UserModel user = UserModel(
      //   name: response!.displayName!,
      //   photoURL: response.photoUrl,
      // );

      final UserModel user = UserModel(
          name: "Nicolas",
          photoURL:
              "https://avatars.githubusercontent.com/u/68689560?s…00&u=b0c6d536ab3ce4f482f7866546caee6b6c2ff150&v=4");

      authController.setUser(context, user);
      // print(response);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
