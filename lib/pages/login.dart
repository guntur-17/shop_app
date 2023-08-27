import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wings_test_app/pages/home.dart';
import 'package:wings_test_app/style/size_config.dart';

import '../style/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  bool isChecked = false;

  void iniState() {
    setState(() {});
  }

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget body() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 16,
          ),
          child: Image.asset(
            'assets/login.png',
            height: SizeConfig.blockSizeVertical * 20,
          ),
        ),
      );
    }

    Widget email() {
      return Focus(
        onFocusChange: (hasFocus) {
          // When you focus on input email, you need to notify the color change into the widget.
          setState(() => hasFocus ? primaryBlue : splashBlueTextStyle);
        },
        child: TextFormField(
          focusNode: emailFocusNode,
          controller: emailController,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            hintText: 'email',
            hintStyle: TextStyle(color: grey, fontSize: 14),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: splashBlueColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: splashBlueColor,
                width: 1.0,
              ),
            ),

            prefixIcon: Icon(
              Icons.email_outlined,
              color: splashBlueColor,
            ),
            // errorText: 'Error message',
            border: const OutlineInputBorder(),
          ),
        ),
      );
    }

    Widget password() {
      return Focus(
        onFocusChange: (hasFocus) {
          // When you focus on input email, you need to notify the color change into the widget.
          setState(() => hasFocus ? primaryBlue : splashBlueColor);
        },
        child: TextFormField(
          focusNode: passwordFocusNode,
          controller: passwordController,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            hintText: 'password',
            hintStyle: TextStyle(color: grey, fontSize: 14),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: splashBlueColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: splashBlueColor,
                width: 1.0,
              ),
            ),

            prefixIcon: Icon(
              Icons.lock_outline,
              color: splashBlueColor,
            ),
            // errorText: 'Error message',
            border: const OutlineInputBorder(),
          ),
        ),
      );
    }

    Widget buttonLogin() {
      return InkWell(
        onTap: () async {
          if (emailController.text == '') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: redColor,
                content: const Text(
                  'Harap Masukkan Email',
                  textAlign: TextAlign.center,
                )));
          } else if (passwordController.text == '') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: redColor,
                content: const Text(
                  'Harap Masukkan Password',
                  textAlign: TextAlign.center,
                )));
          } else if (emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

            Get.to(() => const HomePage());
          }
        },
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 74,
          height: SizeConfig.safeBlockVertical * 6,
          decoration: BoxDecoration(
              color: splashBlueColor, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text(
            'Enter',
            style: whiteInterTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.w700),
          )),
        ),
      );
    }

    Widget footer() {
      return Container(
        height: SizeConfig.blockSizeVertical * 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36))),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 5,
                    left: SizeConfig.safeBlockHorizontal * 12.5,
                    right: SizeConfig.safeBlockHorizontal * 12.5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: splashBlueTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 6.0, bottom: SizeConfig.safeBlockVertical * 1),
                      child: email(),
                    ),
                    Row(
                      children: [
                        Text(
                          'Password',
                          style: splashBlueTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, bottom: 4),
                      child: password(),
                    ),
                    Row(
                      children: [
                        Text(
                          'Lupa Password?',
                          style: splashBlueTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3.2,
                    ),
                    buttonLogin(),
                  ],
                ),
              )),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.blue,
            ],
          )),
          child: Stack(
            children: [
              body(),
              footer(),
            ],
          ),
        ),
      ),
    ));
  }
}
