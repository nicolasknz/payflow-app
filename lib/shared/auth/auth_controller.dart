import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;

      // Nao vai ter como voltar para tela de login caso dê sucesso
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(
        context,
        "/login",
      );
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();

    instance.setString("user", user.toJson());
    return;
  }

  Future<bool> currentUser(BuildContext context) async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));

    if (instance.containsKey("user")) {
      final String json = instance.get("user") as String;

      setUser(context, UserModel.fromJson(json));
      return true;
    } else {
      setUser(context, null);
      return false;
    }
  }
}
