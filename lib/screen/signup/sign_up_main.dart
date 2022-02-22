// @dart=2.9
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ruvick_power/utils/constants/route_constant.dart';
import 'package:ruvick_power/utils/ui/custom_edit_text.dart';
import 'package:ruvick_power/utils/ui/rv_custom_btn_widget.dart';

class MainSignUpScreen extends StatefulWidget {
  const MainSignUpScreen({Key key}) : super(key: key);


  @override
  _MainSignUpScreenState createState() => _MainSignUpScreenState();
}

class _MainSignUpScreenState extends State<MainSignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

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
                    flex: 12,
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SafeArea(
                        bottom: false,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 34,
                                color: Colors.white
                              ),
                            ),
                            const SizedBox(width: 25,),
                          ],
                        ),
                      ),
                    )
                  ),
                  Expanded(
                      flex: 60,
                      child: Container(
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF3F2F2),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70))),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * .03,
                                  ),

                                  CustomEditText(
                                    controller: firstNameController,
                                    textHint: 'John',
                                    editTitle: 'First Name',
                                    keyboardType: TextInputType.text,
                                    isTextObscured: false,
                                    onTextChanged: (value) {},
                                    validator: (value) =>
                                    value.isNotEmpty
                                        ? null
                                        : 'Please enter valid fields',
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  CustomEditText(
                                    controller: lastNameController,
                                    textHint: 'Doe',
                                    editTitle: 'Last Name',
                                    keyboardType: TextInputType.text,
                                    isTextObscured: false,
                                    onTextChanged: (value) {},
                                    validator: (value) =>
                                    value.isNotEmpty
                                        ? null
                                        : 'Please enter valid fields',
                                  ),
                                  const SizedBox(
                                    height: 30,
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
                                  CustomEditText(
                                    controller: confirmPasswordController,
                                    textHint: 'Enter Password',
                                    editTitle: 'Confirm Password',
                                    keyboardType: TextInputType.text,
                                    isTextObscured: true,
                                    onTextChanged: (value) {},
                                    validator: (value) => value == passwordController.text
                                        ? null
                                        : 'Password must match',
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: RVCustomButtonWidget(
                                      width: size.width * .8,
                                      onTap: () {},
                                      title: 'Sign up',
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(RouteConstant.LOGIN);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  const [
                                    AutoSizeText(
                                      'Already have an account? ',
                                      maxLines: 1,
                                      minFontSize: 10,
                                      maxFontSize: 15,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    AutoSizeText(
                                      'Sign in',
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
