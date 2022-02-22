// @dart=2.9
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruvick_power/utils/constants/route_constant.dart';
import 'package:ruvick_power/utils/constants/style.dart';
import 'package:ruvick_power/utils/ui/custom_edit_text.dart';
import 'package:ruvick_power/utils/ui/rv_custom_btn_widget.dart';

class MainLoginScreen extends StatefulWidget {
  MainLoginScreen({Key key}) : super(key: key);

  @override
  _MainLoginScreenState createState() => _MainLoginScreenState();
}

class _MainLoginScreenState extends State<MainLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  'assets/images/bg1.jpeg',
                  fit: BoxFit.fill,
                )),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.black.withOpacity(.85),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Hero(
                      tag: 'loginLogo',
                      transitionOnUserGestures: true,
                      child: Center(
                        child: SizedBox(
                          width: 80,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF3F2F2),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70))),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Center(
                                    child: AutoSizeText(
                                      'Login',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 34,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .08,
                                  ),
                                  CustomEditText(
                                    controller: emailController,
                                    textHint: 'johndoe@gmail.com',
                                    editTitle: 'Email Address',
                                    keyboardType: TextInputType.emailAddress,
                                    isTextObscured: false,
                                    onTextChanged: (value) {},
                                    validator: (value) =>
                                        value.isNotEmpty && value.contains('@')
                                            ? null
                                            : 'Please enter valid fields',
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  CustomEditText(
                                    controller: passwordController,
                                    textHint: 'Enter Password',
                                    editTitle: 'Password',
                                    keyboardType: TextInputType.text,
                                    isTextObscured: true,
                                    onTextChanged: (value) {},
                                    validator: (value) => value.length > 6
                                        ? null
                                        : 'Password must be min of 6 char',
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: RVCustomButtonWidget(
                                      width: size.width * .8,
                                      onTap: () {},
                                      title: 'Sign in',
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(RouteConstant.SIGN_UP);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    AutoSizeText(
                                      'Don\'t have any account? ',
                                      maxLines: 1,
                                      minFontSize: 10,
                                      maxFontSize: 15,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    AutoSizeText(
                                      'Signup',
                                      maxLines: 1,
                                      minFontSize: 10,
                                      maxFontSize: 15,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
