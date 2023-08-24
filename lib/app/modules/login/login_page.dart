import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: Get.width,
            height: Get.height,
          ),
          Container(color: Colors.black45),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 42,
                  width: Get.width * .9,
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      controller.login();
                    },
                    text: 'Entrar com o Google',
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
